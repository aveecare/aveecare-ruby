# frozen_string_literal: true

# Walks every patient across all pages, then page by page.
#
#   AVEECARE_API_KEY=ak_... ruby -Ilib examples/pagination.rb
require "aveecare"

client = Aveecare::Client.new

# Automatic: pages are fetched lazily as you iterate.
count = 0
client.patients.list(limit: 100).each do |patient|
  puts patient.id
  count += 1
end
puts "patients: #{count}"

# By hand: one page at a time.
page = client.patients.list(limit: 50)
loop do
  puts "page of #{page.data.length}"
  break unless page.has_next_page?

  page = page.next_page
end
