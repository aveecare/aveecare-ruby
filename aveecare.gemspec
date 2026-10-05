# frozen_string_literal: true

require_relative "lib/aveecare/version"

Gem::Specification.new do |spec|
  spec.name = "aveecare"
  spec.version = Aveecare::VERSION
  spec.authors = ["AveeCare"]

  spec.summary = "The official Ruby library for the AveeCare API."
  spec.description = "Read and write your home care agency's patients, caregivers, visits, care documentation, " \
                     "billing records and messages from your own servers, with typed models, automatic " \
                     "pagination, retries and idempotency built in. Depends only on the Ruby standard library."
  spec.homepage = "https://www.aveecare.com/docs/api"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata = {
    "homepage_uri" => "https://www.aveecare.com",
    "documentation_uri" => "https://www.aveecare.com/docs/api",
    "source_code_uri" => "https://github.com/aveecare/aveecare-ruby",
    "bug_tracker_uri" => "https://github.com/aveecare/aveecare-ruby/issues",
    "changelog_uri" => "https://github.com/aveecare/aveecare-ruby/blob/main/CHANGELOG.md",
    "rubygems_mfa_required" => "true"
  }

  spec.files = Dir["lib/**/*.rb"] + %w[README.md LICENSE CHANGELOG.md SECURITY.md]
  spec.require_paths = ["lib"]
end
