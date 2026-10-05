# frozen_string_literal: true

require "spec_helper"

RSpec.describe Aveecare::Client do
  describe "configuration" do
    around do |example|
      saved = ENV.to_h.slice("AVEECARE_API_KEY", "AVEECARE_BASE_URL")
      ENV.delete("AVEECARE_API_KEY")
      ENV.delete("AVEECARE_BASE_URL")
      example.run
    ensure
      ENV.delete("AVEECARE_API_KEY")
      ENV.delete("AVEECARE_BASE_URL")
      saved.each { |k, v| ENV[k] = v }
    end

    it "raises ConfigurationError without a key" do
      expect { described_class.new }.to raise_error(Aveecare::ConfigurationError, /AVEECARE_API_KEY/)
    end

    it "defaults the base URL" do
      expect(described_class.new(api_key: "k").base_url).to eq("https://api.aveecare.com")
    end

    it "reads the key and base URL from the environment and trims a trailing slash" do
      ENV["AVEECARE_API_KEY"] = "  ak_env_key  "
      ENV["AVEECARE_BASE_URL"] = "#{BASE}/"
      stub = stub_request(:get, "#{BASE}/v1/me").with(headers: { "Authorization" => "Bearer ak_env_key" })
                                                .to_return(json_response(200, { "object" => "me" }))
      client = described_class.new
      expect(client.base_url).to eq(BASE)
      client.me.retrieve
      expect(stub).to have_been_requested
    end

    it "lets options win over the environment" do
      ENV["AVEECARE_BASE_URL"] = "https://env.example.test"
      expect(described_class.new(api_key: "k", base_url: "https://opt.example.test").base_url)
        .to eq("https://opt.example.test")
    end

    it "never prints the key" do
      expect(new_client.inspect).not_to include(KEY)
    end
  end

  describe "requests" do
    it "sends the standard headers and decodes models and enums" do
      stub = stub_request(:get, "#{BASE}/v1/me").with(
        headers: { "Authorization" => "Bearer #{KEY}", "User-Agent" => "aveecare-ruby/#{Aveecare::VERSION}",
                   "Accept" => "application/json" }
      ).to_return(json_response(200, {
                                  "object" => "me", "id" => "Xk3mP9qR2tLw", "name" => "Payroll export",
                                  "scopes" => %w[read write], "role" => "RootUser", "email" => "avery@example.com",
                                  "expiresAt" => "2027-10-05T00:00:00.000Z",
                                  "organization" => { "id" => "org_1", "name" => "Sunrise Home Care" }
                                }))
      me = new_client.me.retrieve
      expect(stub).to have_been_requested
      expect(me.organization).to be_a(Aveecare::Models::MeOrganization)
      expect(me.organization.name).to eq("Sunrise Home Care")
      expect(me.scopes).to eq([Aveecare::Models::MeScope::READ, Aveecare::Models::MeScope::WRITE])
      expect(me.role).to eq(Aveecare::Models::MeRole::ROOT_USER)
      expect(WebMock).not_to have_requested(:get, "#{BASE}/v1/me").with(headers: { "Idempotency-Key" => /.*/ })
    end

    it "sends snake_case list filters under their wire names" do
      stub = stub_request(:get, "#{BASE}/v1/patients")
             .with(query: { "lifecycle_stage" => "Prospect", "active" => "true", "limit" => "25" })
             .to_return(json_response(200, list_json([patient_json("pat_1")])))
      page = new_client.patients.list(lifecycle_stage: "Prospect", active: true, limit: 25)
      expect(stub).to have_been_requested
      expect(page.data.map(&:id)).to eq(["pat_1"])
      expect(page.data.first.first_name).to eq("Margaret")
      expect(page.data.first.email).to be_nil
      expect(page.object).to eq("list")
      expect(page.has_next_page?).to be(false)
    end

    it "sends required list parameters" do
      stub = stub_request(:get, "#{BASE}/v1/visits")
             .with(query: { "start_from" => "2026-10-01T00:00:00Z", "start_to" => "2026-10-08T00:00:00Z",
                            "status" => "InProgress" })
             .to_return(json_response(200, list_json([])))
      new_client.visits.list(start_from: "2026-10-01T00:00:00Z", start_to: "2026-10-08T00:00:00Z",
                             status: Aveecare::Models::VisitStatus::IN_PROGRESS)
      expect(stub).to have_been_requested
    end

    it "requires the required keyword arguments" do
      expect { new_client.visits.list }.to raise_error(ArgumentError, /start_from/)
    end

    it "formats Time arguments as ISO 8601" do
      stub = stub_request(:get, "#{BASE}/v1/patients")
             .with(query: { "created_after" => "2026-10-01T12:00:00.000Z" })
             .to_return(json_response(200, list_json([])))
      new_client.patients.list(created_after: Time.utc(2026, 10, 1, 12))
      expect(stub).to have_been_requested
    end

    it "escapes path parameters" do
      stub = stub_request(:get, "#{BASE}/v1/patients/a%2Fb%20c").to_return(json_response(200, patient_json("pat_1")))
      new_client.patients.retrieve("a/b c")
      expect(stub).to have_been_requested
    end

    it "keeps response JSON in raw and converts models back to wire JSON" do
      stub_request(:get, "#{BASE}/v1/patients/pat_1")
        .to_return(json_response(200, patient_json("pat_1").merge("somethingNew" => { "a" => 1 })))
      patient = new_client.patients.retrieve("pat_1")
      expect(patient.raw["somethingNew"]).to eq({ "a" => 1 })
      expect(patient.to_h["firstName"]).to eq("Margaret")
      expect(patient.to_h).not_to have_key("somethingNew")
    end

    it "keeps an enum value from a newer API" do
      stub_request(:get, "#{BASE}/v1/patients/pat_1")
        .to_return(json_response(200, patient_json("pat_1").merge("lifecycleStage" => "Alumni")))
      expect(new_client.patients.retrieve("pat_1").lifecycle_stage).to eq("Alumni")
    end

    it "treats an empty 2xx body as nil" do
      stub_request(:delete, "#{BASE}/v1/patients/pat_1").to_return(status: 204, body: "")
      expect(new_client.request("DELETE", "/v1/patients/pat_1")).to be_nil
    end

    it "raises InvalidResponseError for a non-JSON success" do
      stub_request(:get, "#{BASE}/v1/me").to_return(status: 200, body: "<html>not json</html>",
                                                    headers: { "Request-Id" => "req_x" })
      expect { new_client.me.retrieve }.to raise_error(Aveecare::InvalidResponseError) { |e|
        expect(e.status).to eq(200)
        expect(e.request_id).to eq("req_x")
      }
    end
  end

  describe "writes" do
    it "sends only the fields given, an explicit null for nil, and no Idempotency-Key on PATCH" do
      stub = stub_request(:patch, "#{BASE}/v1/patients/pat_1")
             .with { |req| JSON.parse(req.body) == { "firstName" => "Sdk2", "email" => nil, "goesByName" => "Peggy" } }
             .to_return(json_response(200, patient_json("pat_1")))
      new_client.patients.update("pat_1", first_name: "Sdk2", email: nil, goes_by_name: "Peggy")
      expect(stub).to have_been_requested
      expect(WebMock).not_to have_requested(:patch, "#{BASE}/v1/patients/pat_1")
        .with(headers: { "Idempotency-Key" => /.*/ })
    end

    it "sends an empty object when nothing is given" do
      stub = stub_request(:patch, "#{BASE}/v1/patients/pat_1").with(body: "{}")
                                                              .to_return(json_response(200, patient_json("pat_1")))
      new_client.patients.update("pat_1")
      expect(stub).to have_been_requested
    end

    it "deletes and returns the deleted marker" do
      stub_request(:delete, "#{BASE}/v1/patients/pat_1")
        .to_return(json_response(200, { "object" => "patient", "id" => "pat_1", "deleted" => true }))
      deleted = new_client.patients.delete("pat_1")
      expect(deleted.deleted).to be(true)
      expect(deleted.id).to eq("pat_1")
    end

    it "rejects an unknown keyword" do
      expect { new_client.patients.update("pat_1", not_a_field: "x") }.to raise_error(ArgumentError, /not_a_field/)
    end

    it "converts nested hashes (snake_case or wire keys) and models to wire JSON" do
      klass = Aveecare::Models::MeOrganization
      expect(klass.to_wire({ id: "org_1", "name" => "Sunrise" })).to eq({ "id" => "org_1", "name" => "Sunrise" })
      expect(klass.to_wire(klass.from_hash("id" => "org_2"))).to eq({ "id" => "org_2", "name" => nil })
      expect { klass.to_wire({ not_a_field: "x" }) }.to raise_error(ArgumentError, /not_a_field/)
      expect(Aveecare::Serialize.dump({ a: Time.utc(2026, 10, 5), b: [Date.new(2026, 10, 6), :sym] }))
        .to eq({ "a" => "2026-10-05T00:00:00.000Z", "b" => %w[2026-10-06 sym] })
    end
  end

  describe "idempotency" do
    it "generates a UUID key per create and uses the one given" do
      keys = []
      stub_request(:post, "#{BASE}/v1/patients").with do |req|
        keys << req.headers["Idempotency-Key"]
        true
      end.to_return(json_response(201, patient_json("pat_1")))
      client = new_client
      client.patients.create(first_name: "Margaret", last_name: "Alvarez")
      client.patients.create(first_name: "Margaret", last_name: "Alvarez")
      client.patients.create(first_name: "Margaret", last_name: "Alvarez",
                             request_options: { idempotency_key: "import-row-1042" })
      expect(keys[0]).to match(/\A\h{8}-\h{4}-4\h{3}-[89ab]\h{3}-\h{12}\z/)
      expect(keys[1]).not_to eq(keys[0])
      expect(keys[2]).to eq("import-row-1042")
    end

    it "sends the body with Content-Type and wire names, omitting unset optional fields" do
      stub = stub_request(:post, "#{BASE}/v1/patients")
             .with(headers: { "Content-Type" => "application/json" },
                   body: JSON.generate({ "firstName" => "Margaret", "lastName" => "Alvarez", "email" => "m@example.com" }))
             .to_return(json_response(201, patient_json("pat_1")))
      new_client.patients.create(first_name: "Margaret", last_name: "Alvarez", email: "m@example.com")
      expect(stub).to have_been_requested
    end

    it "reuses the key and body across retries" do
      client = new_client
      capture_sleeps(client)
      seen = []
      stub_request(:post, "#{BASE}/v1/patients").with do |req|
        seen << [req.headers["Idempotency-Key"], req.body]
        true
      end.to_return(json_response(429, error_json("rate_limit_error", "rate_limited", "Slow down."), "Retry-After" => "0"))
         .then.to_return(json_response(429, error_json("rate_limit_error", "rate_limited", "Slow down."), "Retry-After" => "0"))
              .then.to_return(json_response(201, patient_json("pat_1")))
      client.patients.create(first_name: "A", last_name: "B")
      expect(seen.length).to eq(3)
      expect(seen.map(&:first).uniq.length).to eq(1)
      expect(seen.map(&:last).uniq.length).to eq(1)
    end
  end

  describe "pagination" do
    def stub_pages
      pages = { nil => [%w[pat_1 pat_2], "c2"], "c2" => [%w[pat_3 pat_4], "c3"], "c3" => [%w[pat_5], nil] }
      pages.each do |cursor, (ids, nxt)|
        query = { "active" => "true", "limit" => "2" }
        query["cursor"] = cursor if cursor
        stub_request(:get, "#{BASE}/v1/patients").with(query: query)
                                                 .to_return(json_response(200, list_json(ids.map { |i| patient_json(i) }, nxt)))
      end
    end

    it "walks every item on every page, keeping the filters" do
      stub_pages
      ids = new_client.patients.list(active: true, limit: 2).map(&:id)
      expect(ids).to eq(%w[pat_1 pat_2 pat_3 pat_4 pat_5])
      expect(WebMock).to have_requested(:get, %r{/v1/patients}).times(3)
    end

    it "is lazy" do
      stub_pages
      page = new_client.patients.list(active: true, limit: 2)
      expect(page.lazy.map(&:id).first(2)).to eq(%w[pat_1 pat_2])
      expect(WebMock).to have_requested(:get, %r{/v1/patients}).times(1)
      expect(page.first(3).map(&:id)).to eq(%w[pat_1 pat_2 pat_3])
    end

    it "pages by hand" do
      stub_pages
      page = new_client.patients.list(active: true, limit: 2)
      counts = [page.data.length]
      while page.has_next_page?
        page = page.next_page
        counts << page.data.length
      end
      expect(counts).to eq([2, 2, 1])
      expect(page.next_cursor).to be_nil
      expect { page.next_page }.to raise_error(Aveecare::Error, /No more pages/)
    end

    it "yields pages with each_page and offers auto_paging_each" do
      stub_pages
      page = new_client.patients.list(active: true, limit: 2)
      expect(page.each_page.map { |pg| pg.data.length }).to eq([2, 2, 1])
      seen = []
      page.auto_paging_each { |patient| seen << patient.id }
      expect(seen.length).to eq(5)
    end

    it "raises the API error mid-iteration" do
      client = new_client
      capture_sleeps(client)
      stub_request(:get, "#{BASE}/v1/patients")
        .to_return(json_response(200, list_json([patient_json("pat_1")], "c2")))
      stub_request(:get, "#{BASE}/v1/patients").with(query: { "cursor" => "c2" })
                                               .to_return(json_response(403, error_json("permission_error", "forbidden", "No.")))
      seen = []
      expect { client.patients.list.each { |p| seen << p.id } }.to raise_error(Aveecare::PermissionError)
      expect(seen).to eq(["pat_1"])
    end
  end

  describe "errors" do
    {
      400 => Aveecare::InvalidRequestError, 422 => Aveecare::InvalidRequestError,
      401 => Aveecare::AuthenticationError, 403 => Aveecare::PermissionError,
      404 => Aveecare::NotFoundError, 409 => Aveecare::ConflictError,
      429 => Aveecare::RateLimitError, 500 => Aveecare::APIError
    }.each do |status, klass|
      it "maps #{status} to #{klass}" do
        stub_request(:get, "#{BASE}/v1/patients/pat_1")
          .to_return(json_response(status, error_json("some_error", "the_code", "Something went wrong.")))
        expect { new_client(max_retries: 0).patients.retrieve("pat_1") }.to raise_error(klass) { |e|
          expect(e).to be_a(Aveecare::APIError)
          expect(e).to be_a(Aveecare::Error)
          expect(e.instance_of?(klass)).to be(true)
          expect([e.status, e.code, e.type, e.request_id, e.error_message])
            .to eq([status, "the_code", "some_error", "req_body_1", "Something went wrong."])
          expect(e.message).to include("the_code").and include("req_body_1").and include(status.to_s)
        }
      end
    end

    it "falls back to the Request-Id header and a generic message for a non-JSON error" do
      stub_request(:get, "#{BASE}/v1/me").to_return(status: 502, body: "<html>bad gateway</html>",
                                                    headers: { "Request-Id" => "req_header_9" })
      expect { new_client(max_retries: 0).me.retrieve }.to raise_error(Aveecare::APIError) { |e|
        expect(e.request_id).to eq("req_header_9")
        expect(e.error_message).to eq("Request failed with status 502")
        expect(e.code).to be_nil
        expect(e.headers["request-id"]).to eq("req_header_9")
      }
    end

    it "exposes Retry-After on rate limit errors" do
      stub_request(:get, "#{BASE}/v1/me")
        .to_return(json_response(429, error_json("rate_limit_error", "rate_limited", "Slow down."),
                                 "Retry-After" => "7"))
      expect { new_client(max_retries: 0).me.retrieve }.to raise_error(Aveecare::RateLimitError) { |e|
        expect(e.retry_after).to eq(7.0)
      }
    end
  end

  describe "retries" do
    it "honors Retry-After, then backs off, capping at one minute" do
      client = new_client(max_retries: 3)
      delays = capture_sleeps(client)
      allow(Kernel).to receive(:rand).and_return(0.0)
      stub_request(:get, "#{BASE}/v1/me")
        .to_return(json_response(429, error_json("rate_limit_error", "rate_limited", "Slow."), "Retry-After" => "3"))
        .then.to_return(json_response(500, error_json("api_error", "internal_error", "Oops.")))
        .then.to_return(json_response(503, error_json("api_error", "internal_error", "Oops."), "Retry-After" => "86400"))
        .then.to_return(json_response(200, { "object" => "me" }))
      client.me.retrieve
      expect(delays).to eq([3.0, 1.0, 60.0])
    end

    it "gives up after max_retries" do
      client = new_client(max_retries: 1)
      capture_sleeps(client)
      stub = stub_request(:get, "#{BASE}/v1/me")
             .to_return(json_response(429, error_json("rate_limit_error", "rate_limited", "Slow."), "Retry-After" => "0"))
      expect { client.me.retrieve }.to raise_error(Aveecare::RateLimitError)
      expect(stub).to have_been_requested.times(2)
    end

    it "retries 408 and 5xx but not other 4xx" do
      client = new_client(max_retries: 3)
      capture_sleeps(client)
      stub_request(:get, "#{BASE}/v1/me").to_return(status: 408).then.to_return(json_response(200, { "object" => "me" }))
      client.me.retrieve
      expect(WebMock).to have_requested(:get, "#{BASE}/v1/me").times(2)

      [400, 401, 403, 404, 409].each do |status|
        WebMock.reset!
        stub = stub_request(:get, "#{BASE}/v1/me").to_return(json_response(status, error_json("x", "y", "no")))
        expect { client.me.retrieve }.to raise_error(Aveecare::APIError)
        expect(stub).to have_been_requested.times(1)
      end
    end

    it "computes jittered exponential backoff capped at 8 seconds" do
      expect((0..5).map { |n| Aveecare::Retry.backoff(n, 0.0) }).to eq([0.5, 1.0, 2.0, 4.0, 8.0, 8.0])
      expect(Aveecare::Retry.backoff(0, 1.0)).to eq(0.375)
      expect(Aveecare::Retry.backoff(1000, 0.5)).to be_between(0, 8)
    end

    it "parses Retry-After seconds and dates" do
      now = Time.utc(2026, 10, 5, 12)
      parse = ->(v) { Aveecare::Retry.parse_retry_after(v, now) }
      expect(parse.call(nil)).to be_nil
      expect(parse.call("")).to be_nil
      expect(parse.call("7")).to eq(7.0)
      expect(parse.call("1.5")).to eq(1.5)
      expect(parse.call("-3")).to be_nil
      expect(parse.call("soon")).to be_nil
      expect(parse.call("Mon, 05 Oct 2026 12:00:30 GMT")).to eq(30.0)
      expect(parse.call("Mon, 05 Oct 2026 11:00:00 GMT")).to eq(0.0)
    end

    it "retries network errors then raises ConnectionError with the cause" do
      client = new_client(max_retries: 1)
      capture_sleeps(client)
      stub = stub_request(:get, "#{BASE}/v1/me").to_raise(Errno::ECONNREFUSED)
      expect { client.me.retrieve }.to raise_error(Aveecare::ConnectionError) { |e|
        expect(e).not_to be_a(Aveecare::TimeoutError)
        expect(e.message).to include("Errno::ECONNREFUSED")
      }
      expect(stub).to have_been_requested.times(2)
    end

    it "reports timeouts as TimeoutError, which is also a ConnectionError" do
      client = new_client(max_retries: 0)
      stub_request(:get, "#{BASE}/v1/me").to_timeout
      expect { client.me.retrieve }.to raise_error(Aveecare::TimeoutError) { |e|
        expect(e).to be_a(Aveecare::ConnectionError)
      }
    end

    it "lets one request override retries and the timeout" do
      client = new_client(max_retries: 5, timeout: 60)
      capture_sleeps(client)
      stub = stub_request(:get, "#{BASE}/v1/me").to_timeout
      expect { client.me.retrieve(request_options: { max_retries: 0, timeout: 1 }) }.to raise_error(Aveecare::TimeoutError)
      expect(stub).to have_been_requested.times(1)
    end

    it "passes the timeout to the connection" do
      http = instance_double(Net::HTTP, :use_ssl= => nil, :open_timeout= => nil, :read_timeout= => nil,
                                        :write_timeout= => nil)
      allow(Net::HTTP).to receive(:new).and_return(http)
      expect(http).to receive(:open_timeout=).with(12)
      expect(http).to receive(:read_timeout=).with(12)
      expect(http).to receive(:write_timeout=).with(12)
      allow(http).to receive(:request).and_return(Net::HTTPOK.new("1.1", "200", "OK").tap { |r|
        r.instance_variable_set(:@read, true)
        r.instance_variable_set(:@body, "{}")
      })
      expect(new_client(timeout: 12).request("GET", "/v1/me")).to eq({})
    end
  end

  describe "headers and options" do
    it "sends client and per-request headers" do
      stub = stub_request(:get, "#{BASE}/v1/me").with(headers: { "X-Trace" => "abc", "X-Once" => "1" })
                                                .to_return(json_response(200, { "object" => "me" }))
      new_client(headers: { "X-Trace" => "abc" }).me.retrieve(request_options: { headers: { "X-Once" => "1" } })
      expect(stub).to have_been_requested
    end

    it "rejects an unknown request option" do
      expect { new_client.me.retrieve(request_options: { retries: 1 }) }.to raise_error(ArgumentError, /retries/)
    end
  end

  describe "models" do
    it "builds and compares models from JSON" do
      a = Aveecare::Models::Patient.from_hash("id" => "pat_1", "firstName" => "A")
      b = Aveecare::Models::Patient.from_hash("id" => "pat_1", "firstName" => "A")
      expect(a).to eq(b)
      expect(a.inspect).to include("first_name=\"A\"")
      expect(a).to be_frozen
    end

    it "lists every enum value" do
      expect(Aveecare::Models::VisitStatus::VALUES).to include("Scheduled", "InProgress")
    end
  end
end
