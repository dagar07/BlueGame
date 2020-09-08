import 'package:BlueGame/src/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData appThemeData() {
  ThemeData _base = ThemeData.light();

  return _base.copyWith(
    primaryColor: primayColor,
    textTheme: _base.textTheme.copyWith(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
      ),
    ),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
        headline1: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    secondaryHeaderColor: Colors.blueGrey[400],
  );
}
