import './endpoint.dart';

class NewsapiClient {
  NewsapiClient(this.apiKey, {this.baseUrl = 'https://newsapi.org/v2/'}) : assert(apiKey != null && apiKey.isNotEmpty && baseUrl != null && baseUrl.isNotEmpty);

  final String apiKey;
  final String baseUrl;

  Future<Map<String, dynamic>> request(Endpoint endpoint) {
    return endpoint.request(apiKey, baseUrl);
  }
}
