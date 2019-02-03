import 'dart:convert';
import 'package:http/http.dart';
import './util/encode_parameters.dart';
import './util/build_url.dart';

abstract class Endpoint {
  String get url;
  Map<String, dynamic> get parameters;
  final Client client = Client();

  Future<Map<String, dynamic>> request(String apiKey) async {
    final String encodedParameters =
        parameters != null ? encodeParameters(parameters) : null;
    final String endpointUrl =
        buildUrl(url, apiKey, parameters: encodedParameters);
    print(endpointUrl);
    final response = await client.get(endpointUrl);
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load response');
    }
  }
}
