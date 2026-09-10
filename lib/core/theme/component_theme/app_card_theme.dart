import 'package:flutter/material.dart';
import '../tokens/app_radius.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardThemeData light(ColorScheme colors) {
    return CardThemeData(
      color: colors.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        side: BorderSide(
          color: colors.outline,
        ),
      ),
    );
  }

  static CardThemeData dark(ColorScheme colors) {
    return light(colors);
  }
}