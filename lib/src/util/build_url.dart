String buildUrl(String baseUrl, String endpointUrl, {String parameters = null}) {
  return baseUrl +
      endpointUrl +
      '?' +
      (parameters != null ? parameters : '');
}
