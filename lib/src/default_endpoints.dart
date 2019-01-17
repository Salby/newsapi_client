import './endpoint.dart';

final _topHeadlines = Endpoint(
  'top-headlines',
  parameters: [
    'sources',
    'q',
    'category',
    'language',
    'country',
  ],
);

final _everything = Endpoint(
  'everything',
  parameters: [
    'q',
    'sources',
    'domains',
    'from',
    'to',
    'language',
    'sortBy',
    'page',
  ],
);

final _sources = Endpoint(
  'sources',
  requireParameters: false,
  parameters: [
    'category',
    'language',
    'country',
  ],
);

class DefaultEndpoints {
  
  static Endpoint get topHeadlines => _topHeadlines;
  static Endpoint get everything => _everything;
  static Endpoint get sources => _sources;

}