# frozen_string_literal: true

require "time"

module Aveecare
  # @api private
  module Retry
    MAX_RETRY_DELAY = 60.0

    module_function

    # Jittered exponential backoff: 0.5s, 1s, 2s, ... capped at 8s, minus up to 25%.
    def backoff(attempt, jitter = Kernel.rand)
      base = [0.5 * (2**[attempt, 10].min), 8.0].min
      base * (1 - (jitter * 0.25))
    end

    def retryable_status?(status)
      status == 408 || status == 429 || status >= 500
    end

    # Retry-After as seconds or an HTTP date; nil when absent or unusable.
    def parse_retry_after(value, now = Time.now)
      return nil if value.nil?

      text = value.to_s.strip
      return nil if text.empty?

      seconds = Float(text, exception: false)
      if seconds
        return nil if seconds.negative? || seconds.nan? || seconds.infinite?

        return seconds
      end
      date = Time.httpdate(text)
      [date - now, 0.0].max
    rescue ArgumentError
      nil
    end
  end
end
