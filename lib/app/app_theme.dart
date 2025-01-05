import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme(
    Color mainColor,
    Brightness brightness,
  ) =>
      ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: mainColor,
          brightness: brightness,
        ),
      );
}
