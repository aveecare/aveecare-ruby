# frozen_string_literal: true

module Aveecare
  # Base class of every error this library raises.
  class Error < StandardError; end

  # Raised by Client.new when no API key was given and AVEECARE_API_KEY is not set.
  class ConfigurationError < Error; end

  # The request never got a response: DNS, TLS or connection failure, or a
  # reset connection. The underlying exception is available as #cause.
  class ConnectionError < Error; end

  # A request attempt exceeded its timeout. It is also a ConnectionError.
  class TimeoutError < ConnectionError; end

  # A 2xx response body was not the JSON this library expected.
  class InvalidResponseError < Error
    attr_reader :status, :request_id

    def initialize(message, status: nil, request_id: nil)
      super(message)
      @status = status
      @request_id = request_id
    end
  end

  # An error response from the API: any non-2xx status. The subclasses below are
  # chosen by status code, so both of these work:
  #
  #   rescue Aveecare::NotFoundError => e
  #   rescue Aveecare::APIError => e   # any non-2xx response
  #
  # 400 and 422 are InvalidRequestError, 401 AuthenticationError, 403
  # PermissionError, 404 NotFoundError, 409 ConflictError and 429
  # RateLimitError. Every other status, including 5xx, is a plain APIError.
  class APIError < Error
    # @return [Integer] the HTTP status code
    attr_reader :status
    # @return [String, nil] machine-readable code such as "not_found" or "insufficient_scope"
    attr_reader :code
    # @return [String, nil] broad category such as "invalid_request_error"
    attr_reader :type
    # @return [String, nil] the Request-Id of the failed request; quote it when contacting support
    attr_reader :request_id
    # @return [Hash{String => String}] response headers, lower-cased names
    attr_reader :headers
    # @return [Hash, nil] the parsed JSON error body, if there was one
    attr_reader :body
    # @return [String] the API's explanation, without the status, code and request id
    attr_reader :error_message

    def initialize(message, status:, code: nil, type: nil, request_id: nil, headers: {}, body: nil)
      @error_message = message
      @status = status
      @code = code
      @type = type
      @request_id = request_id
      @headers = headers
      @body = body
      parts = ["status #{status}"]
      parts << "code #{code}" if code
      parts << "request #{request_id}" if request_id
      super("#{message} (#{parts.join(', ')})")
    end

    # @api private
    def self.for_status(status, message, **details)
      klass =
        case status
        when 400, 422 then InvalidRequestError
        when 401 then AuthenticationError
        when 403 then PermissionError
        when 404 then NotFoundError
        when 409 then ConflictError
        when 429 then RateLimitError
        else APIError
        end
      klass.new(message, status: status, **details)
    end
  end

  # 400 or 422: for example the codes invalid_request and unknown_field.
  class InvalidRequestError < APIError; end

  # 401: unauthorized.
  class AuthenticationError < APIError; end

  # 403: forbidden, insufficient_scope.
  class PermissionError < APIError; end

  # 404: not_found.
  class NotFoundError < APIError; end

  # 409: idempotency_conflict.
  class ConflictError < APIError; end

  # 429: rate_limited.
  class RateLimitError < APIError
    # @return [Float, nil] seconds the API asked us to wait (from Retry-After)
    def retry_after
      Aveecare::Retry.parse_retry_after(headers["retry-after"])
    end
  end
end
