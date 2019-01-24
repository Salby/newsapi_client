import 'package:test/test.dart';
import 'package:newsapi_client/newsapi_client.dart';

void main() {

  NewsApiClient client = NewsApiClient('insert api key here');

  test('topHeadlines request', () async {
    var response = await client.topHeadlines({
      'category': Categories.business,
    });
    expect(response, containsPair('status', 'ok'));
  });

  test('everything request', () async {
    var response = await client.everything({
      'q': 'microsoft',
    });
    expect(response, containsPair('status', 'ok'));
  });

  group('sources', () {

    test('Sources request with parameters', () async {
      var response = await client.sources(parameters: {
        'country': Countries.norway,
      });
      expect(response, containsPair('status', 'ok'));
    });

    test('Sources request without parameters', () async {
      var response = await client.sources();
      expect(response, containsPair('status', 'ok'));
    });

  });

}