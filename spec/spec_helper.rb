# frozen_string_literal: true

require "json"
require "webmock/rspec"
require "aveecare"

BASE = "https://api.example.test"
KEY = "ak_test_secret123"

module Helpers
  def json_response(status, body, headers = {})
    { status: status, body: JSON.generate(body), headers: { "Content-Type" => "application/json" }.merge(headers) }
  end

  def patient_json(id)
    { "object" => "patient", "id" => id, "firstName" => "Margaret", "lastName" => "Alvarez", "email" => nil,
      "active" => true, "lifecycleStage" => "Client" }
  end

  def list_json(items, next_cursor = nil)
    { "object" => "list", "data" => items, "next_cursor" => next_cursor, "has_more" => !next_cursor.nil? }
  end

  def error_json(type, code, message, request_id = "req_body_1")
    { "error" => { "type" => type, "code" => code, "message" => message, "request_id" => request_id } }
  end

  def new_client(**opts)
    Aveecare::Client.new(api_key: KEY, base_url: BASE, **opts)
  end

  # Records the delays the client would have slept, without sleeping.
  def capture_sleeps(client)
    delays = []
    allow(client).to receive(:sleep_for) { |seconds| delays << seconds }
    delays
  end
end

RSpec.configure do |config|
  config.include Helpers
  config.expect_with(:rspec) { |c| c.syntax = :expect }
  config.disable_monkey_patching!
  config.example_status_persistence_file_path = ".rspec_status"
end
