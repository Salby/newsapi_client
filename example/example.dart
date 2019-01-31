import 'package:newsapi_client/newsapi_client.dart';

// Initialize client with your API key.
final client = NewsapiClient('your API key');

// Get top headlines from Canada.
Future<Map<String, dynamic>> topHeadlinesCanada() async => client.topHeadlines({
      'country': Countries.canada,
    });
