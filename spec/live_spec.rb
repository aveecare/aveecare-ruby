# frozen_string_literal: true

# Live tests against a real AveeCare API.
#
# They are skipped unless both AVEECARE_API_KEY and AVEECARE_BASE_URL are set, and
# they create, update and delete one test patient. Use a sandbox or local API,
# never production data:
#
#   AVEECARE_API_KEY=ak_... AVEECARE_BASE_URL=https://... bundle exec rspec spec/live_spec.rb

require "spec_helper"

LIVE = !ENV.fetch("AVEECARE_API_KEY", "").empty? && !ENV.fetch("AVEECARE_BASE_URL", "").empty?

RSpec.describe "live API", if: LIVE do
  before { WebMock.allow_net_connect! }
  after { WebMock.disable_net_connect! }

  let(:client) { Aveecare::Client.new }

  it "retrieves the key" do
    expect(client.me.retrieve.id).not_to be_empty
  end

  it "lists a page, follows the cursor and retrieves an object" do
    first = client.patients.list(limit: 1)
    expect(first.object).to eq("list")
    if first.has_next_page?
      second = first.next_page
      expect(second.data.first&.id).not_to eq(first.data.first&.id) if first.data.any? && second.data.any?
    end
    expect(client.patients.retrieve(first.data.first.id).id).to eq(first.data.first.id) if first.data.any?
  end

  it "creates idempotently, updates and deletes a patient" do
    key = "live-#{Process.clock_gettime(Process::CLOCK_REALTIME, :nanosecond)}"
    created = client.patients.create(first_name: "Sdk", last_name: "Livetest #{key}",
                                     request_options: { idempotency_key: key })
    begin
      replay = client.patients.create(first_name: "Sdk", last_name: "Livetest #{key}",
                                      request_options: { idempotency_key: key })
      expect(replay.id).to eq(created.id)
      expect(client.patients.update(created.id, first_name: "Sdk2").first_name).to eq("Sdk2")
    ensure
      client.patients.delete(created.id)
    end
    expect { client.patients.retrieve(created.id) }.to raise_error(Aveecare::NotFoundError)
  end
end
