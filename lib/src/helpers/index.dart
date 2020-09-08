import 'package:flutter/material.dart';

bool get isDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);

  return inDebugMode;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

// return '?key1=value1&key2=value2' from string Map<String, String>
String stringifyQueryParams(Map<String, dynamic> obj) {
  String queryString = '';

  obj.forEach((key, val) {
    /// if type of value is list
    /// then join all values by ',' and assign to value back
    if (val is List) {
      val = val.toList().join(',');
    }

    /// if value is empty then simple return
    if (val.toString().isEmpty) return;
    queryString += '$key=$val&';
  });

  return queryString.isNotEmpty
      ? '?${queryString.substring(0, (queryString.length - 1))}'
      : '';
}
