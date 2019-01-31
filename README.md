# Newsapi client for dart

```dart
import 'package:newsapi_client/newsapi_client.dart';

// Initialize client.
final client = NewsapiClient('your api key');

// Get top headlines from Canada.
final Map<String, dynamic> canadaHeadlines = client.topHeadlines({
  'country': Countries.canada,
});
```
