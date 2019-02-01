import '../endpoint.dart';
import '../categories.dart';

/// Sources
///
/// This endpoint returns the subset of news publishers
/// that [TopHeadlines] are available from. It's mainly a
/// convenience endpoint that you can use to keep track of
/// the publishers available on the API, and you can pipe
/// it straight through to your users.
///
/// All parameters are optional.
class Sources extends Endpoint {
  Sources({
    this.category,
    this.language,
    this.country,
  });

  final Categories category;
  final String language;
  final String country;

  String get url => 'sources';
  Map<String, dynamic> get parameters => {
        'category': category,
        'language': language,
        'country': country,
      };
}
