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
    this.pageSize: 20,
    this.page,
  })  : assert(sources != null ||
            query != null ||
            category != null ||
            country != null),
        assert(pageSize < 101 && pageSize > 0);

  /// A list of identifiers for the news sources or blogs
  /// you want headlines from. Use the [Sources] endpoint
  /// to locate these programatically or look at
  /// https://newsapi.org/sources.
  ///
  /// Note: you can't mix this parameter with the [sources]
  /// parameter.
  final List<String> sources;

  /// Keywords or phrase to search for.
  final String query;

  /// The category you want to get headlines for. Possible
  /// options are contained in the [Categories] enum.
  ///
  /// Note: you can't mix this parameter with the [country]
  /// or [category] parameters.
  final Categories category;

  /// The 2-letter ISO 3166-1 code for the country you want
  /// to get headlines for. Possible options are contained
  /// in the [Countries] class or can be written as
  /// strings.
  ///
  /// Note: you can't mix this parameter with the [sources]
  /// parameter.
  final String country;

  /// The number of results to return per page (request).
  /// 20 is the default, 100 is the maximum.
  final int pageSize;

  /// Use this to page through the results if the total
  /// results found is greater than the page size.
  final int page;

  String get url => 'top-headlines';
  Map<String, dynamic> get parameters => {
        'sources': sources,
        'query': query,
        'category': category,
        'country': country,
        'pageSize': pageSize,
        'page': page,
      };
}
