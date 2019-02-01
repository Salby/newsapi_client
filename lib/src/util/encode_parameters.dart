import '../categories.dart';
import '../sort_by.dart';

String encodeParameters(Map<String, dynamic> parameters) {
  return parameters.keys.map((k) {
    if (parameters[k] != null) {
      final String key = _handleKey(k);
      final String value = Uri.encodeComponent(_handleValue(parameters[key]));
      return '$key=$value';
    }
  }).join('&');
}

String _handleKey(String key) {
  if (key == 'query') return 'q';
  return key;
}

String _handleValue(dynamic value) {
  if (value is SortBy || value is Categories) return value.toString();
  if (value is DateTime) {
    String day = value.day < 10 ? '0${value.day}' : value.day;
    return '${value.year}-${value.month}-$day';
  }
  return value.toString();
}
