# Newsapi client for dart

A client for the newsapi.org API written in dart.

## Endpoints

### Top headlines

```dart
import 'package:newsapi_client/newsapi_client.dart';

class News {

  final client = NewsapiClient('YOUR API KEY');

  // Get the latest business headlines.
  Future<Map<String, dynamic>> topBusiness() async {
    final response = await client.request(TopHeadlines(
      category: Categories.business,
    ));
    return response;
  }

  [...]
```

### Everything

```dart
  [...]

  // Get all articles with keyword: Microsoft from 2019-02-01 to now.
  Future<Map<String, dynamic>> everythingMicrosoft() async {
    final response = await client.request(Everything(
      query: 'Microsoft',
      from: DateTime.parse('2019-02-01'),
      to: DateTime.now(),
    ));
    return response;
  }

  [...]
```

### Sources

```dart
  [...]

  // Get all norwegian sources.
  Future<Map<String, dynamic>> norwegianSources() async {
    final response = await client.request(Sources(
      country: Country.norway,
    ));
    return response;
  }

}
```
