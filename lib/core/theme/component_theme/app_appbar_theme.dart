import 'package:flutter/material.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static AppBarTheme light(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      scrolledUnderElevation: 0,
    );
  }

  static AppBarTheme dark(ColorScheme colors) {
    return light(colors);
  }
}