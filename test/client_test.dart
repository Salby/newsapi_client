import 'package:test/test.dart';
import 'package:newsapi_client/newsapi_client.dart';

void main() {
  NewsapiClient client = NewsapiClient('YOUR API KEY');

  test('topHeadlines request', () async {
    var response = await client.request(TopHeadlines(
      category: Categories.business,
    ));
    expect(response, containsPair('status', 'ok'));
  });

  test('everything request', () async {
    var response = await client.request(Everything(
      query: 'Microsoft',
    ));
    expect(response, containsPair('status', 'ok'));
  });

  group('sources', () {
    test('Sources request with parameters', () async {
      var response = await client.request(Sources(
        country: Countries.norway,
      ));
      expect(response, containsPair('status', 'ok'));
    });

    test('Sources request without parameters', () async {
      var response = await client.request(Sources());
      expect(response, containsPair('status', 'ok'));
    });
  });
}
