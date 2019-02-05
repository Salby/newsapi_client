import 'package:test/test.dart';
import 'package:newsapi_client/newsapi_client.dart';

void main() {
  NewsapiClient client = NewsapiClient('YOUR API KEY');

  group('Top headlines', () {
    test('Request with `sources` parameter', () async {
      var response = await client.request(TopHeadlines(
        sources: ['bbc-news', 'abc-news'],
      ));
      expect(response, contains('articles'));
    });

    test('Request with `country` parameter', () async {
      var response = await client.request(TopHeadlines(
        country: Countries.norway,
      ));
      expect(response, contains('articles'));
    });

    test('Request with `category` parameter', () async {
      var response = await client.request(TopHeadlines(
        category: Categories.business,
      ));
      expect(response, contains('articles'));
    });

    test('Request with `query` parameter', () async {
      var response = await client.request(TopHeadlines(
        query: 'Microsoft',
      ));
      expect(response, contains('articles'));
    });
  });

  group('Everything', () {
    test('Request with `query` parameter', () async {
      var response = await client.request(Everything(
        query: 'Microsoft',
      ));
      expect(response, contains('articles'));
    });

    test('Request with `sources` parameter', () async {
      var response = await client.request(Everything(
        sources: ['bbc-news', 'abc-news'],
      ));
      expect(response, contains('articles'));
    });

    test('Request with `domains` parameter', () async {
      var response = await client.request(Everything(
        domains: ['bbc.co.uk', 'techcrunch.com'],
      ));
      expect(response, contains('articles'));
    });

    test('Request with `excludeDomains` parameter', () async {
      var response = await client.request(Everything(
        query: 'Microsoft', // Required
        excludeDomains: ['bbc.co.uk', 'techcrunch.com'],
      ));
      expect(response, contains('articles'));
    });

    test('Request with `from` and `to` parameters', () async {
      var response = await client.request(Everything(
        query: 'Microsoft', // Required
        from: DateTime.parse('2019-02-01'),
        to: DateTime.now(),
      ));
      expect(response, contains('articles'));
    });

    test('Request with `language` parameter', () async {
      var response = await client.request(Everything(
        query: 'Microsoft', // Required
        language: 'fr',
      ));
      expect(response, contains('articles'));
    });

    test('Request with `sortBy` parameter', () async {
      var response = await client.request(Everything(
        query: 'Microsoft', // Required
        sortBy: SortBy.popularity,
      ));
      expect(response, contains('articles'));
    });
  });

  group('Sources', () {
    test('Request with `category` parameter', () async {
      var response = await client.request(Sources(
        category: Categories.business,
      ));
      expect(response, contains('sources'));
    });

    test('Request with `language` parameter', () async {
      var response = await client.request(Sources(
        language: 'no',
      ));
      expect(response, contains('sources'));
    });

    test('Request with `country` parameter', () async {
      var response = await client.request(Sources(
        country: Countries.norway,
      ));
      expect(response, contains('sources'));
    });
  });
}
