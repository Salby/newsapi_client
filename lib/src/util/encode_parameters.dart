import '../categories.dart';
import '../sort_by.dart';

String encodeParameters(Map<String, dynamic> parameters) {
  String encodedParameters = '';
  int index = 0;
  for (String k in parameters.keys) {
    if (parameters[k] != null) {
      if (index != 0) {
        encodedParameters = encodedParameters + '&';
      }
      final String key = _handleKey(k);
      final String value = Uri.encodeComponent(_handleValue(parameters[k]));
      encodedParameters = encodedParameters + '$key=$value';
      index++;
    }
  }
  return encodedParameters;
}

String _handleKey(String key) {
  if (key == 'query') return 'q';
  return key;
}

String _handleValue(dynamic value) {
  if (value is List<String>) {
    return value.map((s) => s).join(',');
  }
  if (value is SortBy) {
    return value.toString().replaceAll('SortBy.', '');
  }
  if (value is Categories) {
    return value.toString().replaceAll('Categories.', '');
  }
  if (value is DateTime) {
    String day = value.day < 10 ? '0${value.day}' : value.day;
    return '${value.year}-${value.month}-$day';
  }
  return value.toString();
}
