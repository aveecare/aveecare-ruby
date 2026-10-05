# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project uses
[Semantic Versioning](https://semver.org/).

## [Unreleased]

## [0.1.0] - 2026-10-05

### Added

- First release of the AveeCare Ruby gem.
- Resource objects for every public API resource, with keyword arguments and
  snake_case model attributes.
- Cursor pagination with `Page`, which is `Enumerable` and pages automatically.
- Typed errors carrying the error code, HTTP status and request ID.
- Automatic retries with jittered exponential backoff for rate limits (honoring
  `Retry-After`), server errors and network failures.
- Automatic `Idempotency-Key` on every create request.
