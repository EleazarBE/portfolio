
import 'package:flutter/material.dart';

class AppTheme {
  static const background = Color(0xFFF4F3EF);
  static const surface = Color(0xFFE8E7E1);
  static const ink = Color(0xFF171717);
  static const secondaryInk = Color(0xFF686862);
  static const border = Color(0xFFD0CFC8);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.light(
        primary: ink,
        onPrimary: background,
        surface: background,
        onSurface: ink,
      ),
      dividerColor: border,
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: ink,
        elevation: 0,
      ),
    );
  }
}
