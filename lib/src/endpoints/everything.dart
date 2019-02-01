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
/// You must include at least one [query], [source], or [domain].
class Everything extends Endpoint {
  Everything({
    this.query,
    this.sources,
    this.domains,
    this.from,
    this.to,
    this.language,
    this.sortBy,
    this.pageSize,
    this.page,
  }) : assert((query != null && query.isNotEmpty) ||
            sources != null ||
            (domains != null && domains.isNotEmpty));

  final String query;
  final List<String> sources;
  final List<String> domains;
  final DateTime from;
  final DateTime to;
  final String language;
  final SortBy sortBy;
  final int pageSize;
  final int page;

  String get url => 'everything';
  Map<String, dynamic> get parameters => {
        'query': query,
        'sources': sources,
        'domains': domains,
        'from': from,
        'to': to,
        'language': language,
        'sortBy': sortBy,
        'pageSize': pageSize,
        'page': page,
      };
}
