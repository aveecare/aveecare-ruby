# Contributing to aveecare-ruby

Thanks for helping improve the AveeCare Ruby gem.

## How this library is built

- **Models and resource classes are generated** from the public AveeCare OpenAPI
  specification, published in
  [aveecare-openapi](https://github.com/aveecare/aveecare-openapi). Everything in
  `lib/aveecare/generated/` is overwritten on each release, so please do not edit it
  by hand. If a model, field or endpoint is wrong or missing, open an issue here or
  in aveecare-openapi and we will fix it at the source.
- **The runtime is hand-written** (configuration, authentication, retries,
  pagination, errors). Fixes and improvements to it are very welcome as pull
  requests.

## Development

You need Ruby 3.0 or newer.

```sh
bundle install
bundle exec rspec
bundle exec rubocop
gem build aveecare.gemspec
```

Unit tests use WebMock and never touch the network. Live tests run only when both
`AVEECARE_API_KEY` and `AVEECARE_BASE_URL` are set, and they create, update and
delete one test patient, so point them at a sandbox:

```sh
AVEECARE_API_KEY=ak_... AVEECARE_BASE_URL=https://... bundle exec rspec spec/live_spec.rb
```

## Pull requests

1. Open an issue first for anything larger than a small fix.
2. Add or update tests for the behaviour you change.
3. Keep the public API backwards compatible within a major version.
4. Add a line to `CHANGELOG.md` under "Unreleased".

By contributing you agree that your contributions are licensed under the MIT
License, and you agree to follow our [Code of Conduct](CODE_OF_CONDUCT.md).

Security issues: please follow [SECURITY.md](SECURITY.md) instead of opening a
public issue.

## Releasing (maintainers)

Update `VERSION` in `lib/aveecare/version.rb` and `CHANGELOG.md`, commit, then push a
tag matching the version (`git tag v0.1.1 && git push origin v0.1.1`). The publish
workflow checks the tag against the gem version, runs the specs and pushes the gem to
RubyGems.

Publishing needs a RubyGems API key: create one on rubygems.org with the "Push rubygem"
scope and save it as the `GEM_HOST_API_KEY` secret of this repository's `rubygems`
environment. Until it exists the push step fails and nothing is released. (RubyGems
trusted publishing is an alternative: add this repository and `publish.yml` as a trusted
publisher on rubygems.org and replace the push step with `rubygems/release-gem`.)
