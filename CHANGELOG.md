# Changelog

[Unreleased]

### Added
- Added missing `pageSize` and `page` parameters to `TopHeadlines` endpoint.
- Added missing `excludeDomains` parameter to `Everything` endpoint.
- Added documentation to `Sources` endpoint parameters.
- Added documentation to `TopHeadlines` endpoint parameters.
- Added documentation to `Everything` endpoint parameters.
- Added tests for all the different endpoints and their parameters.

### Changed
- The API key is now delivered over an HTTP header instead of being a url-parameter.

### Deprecated
- Removed *language* parameter from `TopHeadlines` endpoint. It didn't work in the first place, so this shouldn't affect anything.

## 0.2.2 - 2019-02-03

### Added
- Added new examples to README from `./example/example.dart`.

### Changed
- Updated `./example/example.dart` with more, better examples.

### Fixed
- Fixed parameters not being encoded correctly when handling enums or null values.
- Fixed `apiKey` not being added correctly to the final url.

## 0.2.1 - 2019-02-01

### Added
- Added contributing guide.
- Added license.

### Changed
- Changed tests so that they work with with the updated `NewsapiClient`.

## 0.2.0 - 2019-02-01

### Added
- Generated dartdoc documentation.

### Changed
- Changed the way requesting works to make it easier to read and write.

## 0.1.0 - 2019-01-31

### Added
- Added client functionality.
- Added country constants.
- Added category constants.
