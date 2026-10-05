# frozen_string_literal: true

require "erb"
require "json"
require "net/http"
require "openssl"
require "securerandom"
require "uri"

module Aveecare
  # The AveeCare API client. Each resource is a method: +client.patients+,
  # +client.visits+, +client.me+ and so on.
  #
  #   client = Aveecare::Client.new(api_key: ENV.fetch("AVEECARE_API_KEY"))
  #   client.patients.list(limit: 25).each { |patient| puts patient.id }
  #
  # A Client is safe to share between threads.
  class Client
    include ResourceAccessors

    # The API origin used when none is configured.
    DEFAULT_BASE_URL = "https://api.aveecare.com"
    # Default per-attempt timeout in seconds.
    DEFAULT_TIMEOUT = 60
    # Default number of retries for 408, 429, 5xx and network errors.
    DEFAULT_MAX_RETRIES = 2

    NETWORK_ERRORS = [
      SocketError, IOError, EOFError, SystemCallError, OpenSSL::SSL::SSLError,
      Net::ProtocolError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError
    ].freeze
    TIMEOUT_ERRORS = [Net::OpenTimeout, Net::ReadTimeout, Net::WriteTimeout, ::Timeout::Error].freeze
    REQUEST_OPTION_KEYS = %i[idempotency_key timeout max_retries headers].freeze

    # @return [String] the API origin requests go to
    attr_reader :base_url

    # @param api_key [String, nil] your secret key, ak_<keyId>_<secret>; defaults to the
    #   AVEECARE_API_KEY environment variable
    # @param base_url [String, nil] the API origin; defaults to AVEECARE_BASE_URL, then
    #   https://api.aveecare.com
    # @param timeout [Numeric, nil] per-attempt timeout in seconds (default 60); it bounds
    #   connecting and each read or write
    # @param max_retries [Integer] retries after a 408, 429, 5xx or network error (default 2)
    # @param headers [Hash{String => String}, nil] extra headers sent with every request
    # @raise [Aveecare::ConfigurationError] when no API key is available
    def initialize(api_key: nil, base_url: nil, timeout: DEFAULT_TIMEOUT, max_retries: DEFAULT_MAX_RETRIES,
                   headers: nil)
      key = (api_key || ENV.fetch("AVEECARE_API_KEY", "")).to_s.strip
      if key.empty?
        raise ConfigurationError,
              "No API key provided. Pass api_key: or set the AVEECARE_API_KEY environment variable. " \
              "See https://www.aveecare.com/docs/api/authentication"
      end
      origin = (base_url || ENV.fetch("AVEECARE_BASE_URL", "")).to_s.strip
      origin = DEFAULT_BASE_URL if origin.empty?
      @api_key = key
      @base_url = origin.sub(%r{/+\z}, "")
      @timeout = timeout
      @max_retries = Integer(max_retries)
      @headers = (headers || {}).transform_keys(&:to_s).freeze
    end

    def inspect
      "#<#{self.class.name} base_url=#{base_url.inspect} api_key=[REDACTED]>"
    end

    # @api private
    # Sends one request, retrying 408, 429, 5xx and network errors, and returns
    # the parsed JSON body (nil when there is none).
    def request(method, path, query: nil, body: nil, idempotent: false, options: nil)
      options = validate_options(options)
      url = build_url(path, query)
      payload = body.nil? ? nil : JSON.generate(body)
      headers = build_headers(method, payload, idempotent, options)
      max_retries = options.fetch(:max_retries, @max_retries)
      timeout = options.fetch(:timeout, @timeout)

      attempt = 0
      loop do
        begin
          response = perform(method, url, headers, payload, timeout)
        rescue ConnectionError
          raise unless attempt < max_retries

          sleep_for(Retry.backoff(attempt))
          attempt += 1
          next
        end

        status = response.code.to_i
        return parse_success(response, status) if status.between?(200, 299)

        if Retry.retryable_status?(status) && attempt < max_retries
          delay = Retry.parse_retry_after(response["retry-after"]) || Retry.backoff(attempt)
          sleep_for([delay, Retry::MAX_RETRY_DELAY].min)
          attempt += 1
          next
        end
        raise api_error(response, status)
      end
    end

    # @api private
    # Requests one list page and arms it to fetch the next with the same filters.
    def get_page(path, query, item_class, options)
      json = request("GET", path, query: query, options: options)
      unless json.is_a?(Hash) && json["data"].is_a?(Array)
        raise InvalidResponseError, "Expected a list response from #{path}"
      end

      items = json["data"].map { |item| item.is_a?(Hash) && item_class ? item_class.from_hash(item) : item }
      Page.new(
        data: items,
        next_cursor: json["next_cursor"],
        has_more: json["has_more"] == true,
        fetcher: ->(cursor) { get_page(path, (query || {}).merge("cursor" => cursor), item_class, options) }
      )
    end

    private

    # Overridable in tests.
    def sleep_for(seconds)
      Kernel.sleep(seconds) if seconds.positive?
    end

    def validate_options(options)
      options ||= {}
      unknown = options.keys - REQUEST_OPTION_KEYS
      raise ArgumentError, "unknown request option(s): #{unknown.join(', ')}" unless unknown.empty?

      options
    end

    def build_url(path, query)
      url = "#{@base_url}#{path}"
      pairs = []
      (query || {}).each do |key, value|
        next if value.nil?

        (value.is_a?(Array) ? value : [value]).each { |item| pairs << [key.to_s, Serialize.dump(item).to_s] }
      end
      pairs.empty? ? url : "#{url}?#{URI.encode_www_form(pairs)}"
    end

    def build_headers(method, payload, idempotent, options)
      headers = {
        "Accept" => "application/json",
        "Authorization" => "Bearer #{@api_key}",
        "User-Agent" => "aveecare-ruby/#{VERSION}"
      }
      headers.merge!(@headers)
      headers.merge!((options[:headers] || {}).transform_keys(&:to_s))
      headers["Content-Type"] = "application/json" if payload
      if method == "POST" || idempotent
        key = options[:idempotency_key] || headers.find { |k, _| k.casecmp?("idempotency-key") }&.last
        headers["Idempotency-Key"] = key || SecureRandom.uuid
      end
      headers
    end

    def perform(method, url, headers, payload, timeout)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"
      http.open_timeout = timeout
      http.read_timeout = timeout
      http.write_timeout = timeout
      request = Net::HTTP.const_get(method.capitalize).new(uri.request_uri, headers)
      request.body = payload if payload
      http.request(request)
    rescue *TIMEOUT_ERRORS => e
      raise TimeoutError, "request timed out after #{timeout}s (#{e.class})"
    rescue *NETWORK_ERRORS => e
      raise ConnectionError, "could not reach the AveeCare API: #{e.message} (#{e.class})"
    end

    def parse_success(response, status)
      text = response.body.to_s
      return nil if text.strip.empty?

      JSON.parse(text)
    rescue JSON::ParserError => e
      raise InvalidResponseError.new(
        "The API returned a non-JSON response (status #{status}): #{e.message}",
        status: status, request_id: response["request-id"]
      )
    end

    def api_error(response, status)
      headers = response.each_header.to_h { |k, v| [k.downcase, v] }
      details = { request_id: headers["request-id"], headers: headers }
      message = "Request failed with status #{status}"
      begin
        parsed = JSON.parse(response.body.to_s)
        if parsed.is_a?(Hash) && parsed["error"].is_a?(Hash)
          err = parsed["error"]
          message = err["message"] if err["message"].is_a?(String) && !err["message"].empty?
          details[:code] = err["code"]
          details[:type] = err["type"]
          details[:request_id] = err["request_id"] if err["request_id"].is_a?(String)
          details[:body] = parsed
        end
      rescue JSON::ParserError
        nil
      end
      APIError.for_status(status, message, **details)
    end
  end
end
