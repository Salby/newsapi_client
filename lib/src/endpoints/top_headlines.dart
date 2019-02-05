import '../endpoint.dart';
import '../categories.dart';

/// Top headlines
///
/// This endpoint provides live top and breaking headlines
/// for a [country], single source, or multiple [sources].
/// You can also use a [query] to search with keywords. You
/// can also set a [category] as well as a [language].
/// Articles are sorted by the earliest date first.
/// This endpoint is great for retrieving headlines for
/// display on news tickers or similar.
///
/// All parameters passed to TopHeadlines are optional, but
/// you need to include at least one of them.
class TopHeadlines extends Endpoint {
  TopHeadlines({
    this.sources,
    this.query,
    this.category,
    this.country,
  }) : assert(sources != null ||
            query != null ||
            category != null ||
            country != null);

  final List<String> sources;
  final String query;
  final Categories category;
  final String country;

  String get url => 'top-headlines';
  Map<String, dynamic> get parameters => {
        'sources': sources,
        'query': query,
        'category': category,
        'country': country,
      };
}
