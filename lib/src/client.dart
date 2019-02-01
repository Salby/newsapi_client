import './endpoint.dart';

class NewsapiClient {
  NewsapiClient(this.apiKey) : assert(apiKey != null && apiKey.isNotEmpty);

  final String apiKey;

  Future<Map<String, dynamic>> request(Endpoint endpoint) {
    return endpoint.request(apiKey);
  }
}
