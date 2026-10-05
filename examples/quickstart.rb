# frozen_string_literal: true

# Lists a few patients.
#
#   AVEECARE_API_KEY=ak_... ruby -Ilib examples/quickstart.rb
require "aveecare"

client = Aveecare::Client.new(api_key: ENV.fetch("AVEECARE_API_KEY"))

client.patients.list(active: true, limit: 25).each do |patient|
  puts "#{patient.id} #{patient.first_name} #{patient.last_name}"
end
