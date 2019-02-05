import '../endpoint.dart';
import '../sort_by.dart';

/// Everything
///
/// Search through millions of articles from over 30.000
/// large and small news sources and blogs. This includes
/// breaking news as well as lesser articles.
/// This endpoint suits article discovery and analysis, but
/// can be used to retrieve articles for display, too.
///
/// You must include at least one [query], [sources], or [domains].
class Everything extends Endpoint {
  Everything({
    this.query,
    this.sources,
    this.domains,
    this.excludeDomains,
    this.from,
    this.to,
    this.language,
    this.sortBy,
    this.pageSize: 20,
    this.page,
  })  : assert((query != null && query.isNotEmpty) ||
            sources != null ||
            (domains != null && domains.isNotEmpty)),
        assert(pageSize < 101 && pageSize > 0);

  /// Keywords or phrase to search for.
  final String query;

  /// A list of identifiers (maximum 20) for the news
  /// sources or blogs you want headlines from. Use the
  /// [Sources] endpoint to locate these programmatically
  /// or look at https://newsapi.org/sources.
  final List<String> sources;

  /// A list of domains (e.g. bbc.co.uk, techcrunch.com) to
  /// restrict the search to.
  final List<String> domains;

  /// A list of domains (e.g. bbc.co.uk, techcrunch.com) to
  /// remove from the results.
  final List<String> excludeDomains;

  /// A date and optional time for the *oldest* article
  /// allowed.
  ///
  /// {@tool sample}
  /// ```dart
  /// Everything(
  ///   from: DateTime.parse('2019-02-01'),
  /// );
  /// ```
  /// {@end-tool}
  ///
  /// Defaults to whatever your newsapi.org plan allows.
  final DateTime from;

  /// A date and optional time for the *newest* article
  /// allowed.
  ///
  /// {@tool sample}
  /// ```dart
  /// Everything(
  ///   to: DateTime.now(),
  /// );
  /// ```
  /// {@end-tool}
  ///
  /// Defaults to whatever your newsapi.org plan allows.
  final DateTime to;

  /// The 2-letter ISO-639-1 code of the language you want
  /// to get headlines for. Possible options: 'ar', 'de',
  /// 'en', 'es', 'fr', 'he', 'it', 'nl', 'no', 'pt', 'ru',
  /// 'se', 'ud', 'zh'.
  ///
  /// Defaults to all languages.
  final String language;

  /// The order to sort the articles in. Possible options:
  ///
  /// - [SortBy.relevancy]: Articles more closely related
  ///                       to [query] come first.
  ///
  /// - [SortBy.popularity]: Articles from popular sources
  ///                        and publishers come first.
  ///
  /// - [SortBy.publishedAt]: Newest articles come first.
  ///
  /// Defaults to [SortBy.publishedAt].
  final SortBy sortBy;

  /// The number of results to return per page (request).
  /// 20 is the default, 100 is the maximum.
  final int pageSize;

  /// Use this to page through the results.
  final int page;

  String get url => 'everything';
  Map<String, dynamic> get parameters => {
        'query': query,
        'sources': sources,
        'domains': domains,
        'excludeDomains': excludeDomains,
        'from': from,
        'to': to,
        'language': language,
        'sortBy': sortBy,
        'pageSize': pageSize,
        'page': page,
      };
}
