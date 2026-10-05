# frozen_string_literal: true

require "erb"

module Aveecare
  # Base class of every resource (+client.patients+, +client.visits+, ...).
  class Resource
    # @api private
    def initialize(client)
      @client = client
    end

    private

    # Percent-encodes one path segment.
    def esc(segment)
      ERB::Util.url_encode(segment.to_s)
    end
  end
end
