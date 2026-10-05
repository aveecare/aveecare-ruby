# AveeCare Ruby Library

[![Gem Version](https://img.shields.io/gem/v/aveecare.svg)](https://rubygems.org/gems/aveecare)
[![CI](https://github.com/aveecare/aveecare-ruby/actions/workflows/ci.yml/badge.svg)](https://github.com/aveecare/aveecare-ruby/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/aveecare/aveecare-ruby/blob/main/LICENSE)

The official Ruby library for the [AveeCare API](https://www.aveecare.com/docs/api).
Read and write your home care agency's patients, visits, invoices and more from your own
servers, with typed models, automatic pagination, retries and idempotency built in.

- Ruby 3.0 or newer, standard library only (`net/http`), no runtime dependencies
- Keyword arguments, snake_case model attributes, `Enumerable` auto-paging
- Typed errors, automatic retries with backoff and automatic idempotency keys

## Install

```sh
gem install aveecare
```

Or in your `Gemfile`:

```ruby
gem "aveecare"
```

## Quickstart

Create an API key in AveeCare, then:

```ruby
require "aveecare"

client = Aveecare::Client.new(api_key: ENV.fetch("AVEECARE_API_KEY"))

client.patients.list(active: true, limit: 25).each do |patient|
  puts "#{patient.id} #{patient.first_name} #{patient.last_name}"
end
```

## Authentication

Every request is authenticated with your secret API key, sent as
`Authorization: Bearer ak_<keyId>_<secret>`. Pass it as `api_key:`, or leave it out and
set `AVEECARE_API_KEY`: `Aveecare::Client.new` reads it for you and raises
`Aveecare::ConfigurationError` when there is none. Keys are read-only or read and write;
see [Authentication](https://www.aveecare.com/docs/api/authentication).

Keep keys on your server. Never put an API key in browser or mobile code.

## Usage

```ruby
# Retrieve, create, update and delete
patient = client.patients.retrieve("pat_8f2k1m9x")
created = client.patients.create(first_name: "Margaret", last_name: "Alvarez")
updated = client.patients.update(created.id, primary_language: "Spanish", email: nil)
client.patients.delete(created.id)

# Visits are listed by start-time window (at most 93 days)
visits = client.visits.list(start_from: "2026-10-01T00:00:00Z", start_to: "2026-10-08T00:00:00Z")

# The API key making the request
me = client.me.retrieve
```

Model attributes are snake_case (`patient.first_name`, `patient.created_at`) and map to
the API's camelCase JSON; `patient.to_h` gives the JSON back. Request methods take
keyword arguments, and `Time` and `Date` values are formatted for you. On an update,
leaving a field out leaves it unchanged, while passing `nil` clears a field that can be
cleared (`email: nil` above sends JSON `null`). Fields the API adds later are kept on
the model and never break parsing.

## Pagination

`list` returns one `Page`. A `Page` is `Enumerable`, and iterating it walks every item
on this page and every following page, fetching more lazily as you go:

```ruby
client.patients.list(limit: 100).each { |patient| puts patient.id }

# Stops fetching as soon as it has ten matches
client.patients.list.lazy.select { |p| p.active }.first(10)
```

To go page by page, use `page.has_next_page?` and `page.next_page`, or
`page.each_page`:

```ruby
page = client.patients.list(limit: 50)
loop do
  puts "page of #{page.data.length}"
  break unless page.has_next_page?

  page = page.next_page
end
```

## Errors

Every error is an `Aveecare::Error`. A non-2xx response raises an `Aveecare::APIError`
subclass:

```ruby
begin
  client.patients.retrieve("pat_missing")
rescue Aveecare::NotFoundError => e
  puts "no such patient (request #{e.request_id})"
rescue Aveecare::RateLimitError => e
  puts "slow down, retry in #{e.retry_after} seconds"
rescue Aveecare::APIError => e
  puts "#{e.status} #{e.code} #{e.message}"
end
```

| Status | Class | Example codes |
|---|---|---|
| 400 | `Aveecare::InvalidRequestError` | `invalid_request`, `unknown_field` |
| 401 | `Aveecare::AuthenticationError` | `unauthorized` |
| 403 | `Aveecare::PermissionError` | `forbidden`, `insufficient_scope` |
| 404 | `Aveecare::NotFoundError` | `not_found` |
| 409 | `Aveecare::ConflictError` | `idempotency_conflict` |
| 429 | `Aveecare::RateLimitError` | `rate_limited` |
| other | `Aveecare::APIError` | `internal_error` |

Every one has `status`, `code`, `type`, `message`, `request_id` and `headers`. Network
failures raise `Aveecare::ConnectionError`, and timeouts `Aveecare::TimeoutError` (a
`ConnectionError`).

## Retries, timeouts and idempotency

Rate-limited (429), server error (5xx) and network failures are retried twice by
default with jittered exponential backoff. When the API sends `Retry-After`, the client
waits that long.

Every `create` sends an `Idempotency-Key` (a random UUID), and the same key is reused
across retries, so a retried create never makes a duplicate. Pass your own key to make
a create safe to repeat across processes:

```ruby
client = Aveecare::Client.new(
  api_key: ENV.fetch("AVEECARE_API_KEY"),
  max_retries: 4,
  timeout: 20
)

client.patients.create(
  first_name: "Margaret",
  last_name: "Alvarez",
  request_options: { idempotency_key: "import-row-1042" }
)
```

## Configuration

`Aveecare::Client.new` accepts `api_key:` (default `AVEECARE_API_KEY`), `base_url:`
(default `AVEECARE_BASE_URL`, then `https://api.aveecare.com`), `timeout:` (60 seconds
per attempt), `max_retries:` (2) and `headers:`. Per call, pass `request_options:` with
`idempotency_key`, `timeout`, `max_retries` or `headers`. Every request sends
`User-Agent: aveecare-ruby/<version>`. A client is safe to share between threads.

## Documentation

The full API reference, with every resource and field, is at
[www.aveecare.com/docs/api](https://www.aveecare.com/docs/api). Building an integration
to offer other agencies? See the
[AveeCare Partner Center](https://www.aveecare.com/partners).

## Other official SDKs

- [aveecare-node](https://github.com/aveecare/aveecare-node): Node.js and TypeScript
- [aveecare-python](https://github.com/aveecare/aveecare-python): Python
- [aveecare-rust](https://github.com/aveecare/aveecare-rust): Rust
- [aveecare-go](https://github.com/aveecare/aveecare-go): Go
- [aveecare-ruby](https://github.com/aveecare/aveecare-ruby): Ruby
- [aveecare-php](https://github.com/aveecare/aveecare-php): PHP
- [aveecare-java](https://github.com/aveecare/aveecare-java): Java and Kotlin
- [aveecare-dotnet](https://github.com/aveecare/aveecare-dotnet): .NET
- [aveecare-cli](https://github.com/aveecare/aveecare-cli): command line
- [aveecare-openapi](https://github.com/aveecare/aveecare-openapi): OpenAPI specification
- [aveecare-mcp](https://github.com/aveecare/aveecare-mcp): connect AI assistants
- [aveecare-examples](https://github.com/aveecare/aveecare-examples): sample apps

## License

MIT. See [LICENSE](https://github.com/aveecare/aveecare-ruby/blob/main/LICENSE).

---

Built by [AveeCare](https://www.aveecare.com) — home care software.
