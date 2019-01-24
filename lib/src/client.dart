import 'dart:convert';
import 'package:http/http.dart';
import './endpoint.dart';
import './default_endpoints.dart';

class NewsApiClient {

  NewsApiClient(this.apiKey)
      : assert(apiKey != null),
        assert(apiKey.isNotEmpty);

  final String apiKey;
  final Client client = Client();
  final String url = 'https://newsapi.org/v2/';

  Future<Map<String, dynamic>> topHeadlines(Map<String, dynamic> parameters) async {
    final Endpoint endpoint = DefaultEndpoints.topHeadlines;
    if (_validateParameters(parameters, endpoint)) {
      final response = await client.get(_buildUrl(endpoint.name, parameters: parameters));
      return _handleResponse(response);
    } else {
      throw Exception('Given parameters are not valid.');
    }
  }

  Future<Map<String, dynamic>> everything(Map<String, dynamic> parameters) async {
    final Endpoint endpoint = DefaultEndpoints.everything;
    if (_validateParameters(parameters, endpoint)) {
      final response = await client.get(_buildUrl(endpoint.name, parameters: parameters));
      return _handleResponse(response);
    } else {
      throw Exception('Given parameters are not valid.');
    }
  }

  Future<Map<String, dynamic>> sources({Map<String, dynamic> parameters: null}) async {
    final Endpoint endpoint = DefaultEndpoints.sources;
    if (parameters != null && !_validateParameters(parameters, endpoint)) {
      throw Exception('Given parameters are not valid.');
    }
    final response = await client.get(_buildUrl(endpoint.name, parameters: parameters));
    return _handleResponse(response);
  }

  String _buildUrl(String endpointName, {Map<String, dynamic> parameters: null}) {
    return  url
          + endpointName
          + '?'
          + (parameters != null ? _encodeParameters(parameters) + '&' : '')
          + 'apiKey=$apiKey';
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load response.');
    }
  }

  bool _validateParameters(Map<String, dynamic> parameters, Endpoint endpoint) {
    parameters.keys.map((String key) {
      if (!endpoint.parameters.contains(key))
        return false;
    });
    return true;
  }

  String _encodeParameters(Map<String, dynamic> parameters) {
    return parameters.keys.map((key) => '${Uri.encodeComponent(key)}=${Uri.encodeComponent(parameters[key])}').join('&');
  }
}