String buildUrl(String endpointUrl, String apiKey, {String parameters: null}) {
  return 'https://newsapi.org/v2/' +
      endpointUrl +
      '?' +
      (parameters != null ? parameters : '') +
      '&apiKey=$apiKey';
}
