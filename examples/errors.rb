# frozen_string_literal: true

# Shows how to rescue typed errors.
#
#   AVEECARE_API_KEY=ak_... ruby -Ilib examples/errors.rb
require "aveecare"

client = Aveecare::Client.new

begin
  client.patients.retrieve("pat_missing")
rescue Aveecare::NotFoundError => e
  puts "no such patient (request #{e.request_id})"
rescue Aveecare::RateLimitError => e
  puts "slow down, retry in #{e.retry_after} seconds"
rescue Aveecare::APIError => e
  puts "#{e.status} #{e.code} #{e.message}"
end
