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

  /// Find sources that display news of this category.
  /// Possible options are contained in the [Categories]
  /// enum.
  /// Defaults to all categories.
  final Categories category;

  /// Find sources that display news in a specific
  /// language.
  /// Possible options are: 'ar', 'de', 'en', 'es', 'fr',
  /// 'he', 'it', 'nl', 'no', 'pt', 'ru', 'se', 'ud', 'zh'.
  /// Defaults to all languages.
  final String language;

  /// Find sources that display news in a specific country.
  /// Possible options are contained in the [Countries]
  /// class.
  /// Defaults to all countries.
  final String country;

  String get url => 'sources';
  Map<String, dynamic> get parameters => {
        'category': category,
        'language': language,
        'country': country,
      };
}
