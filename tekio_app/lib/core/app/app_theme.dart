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
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      );
}
