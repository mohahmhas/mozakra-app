import 'package:flutter/material.dart';
import '../tokens/app_radius.dart';

class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme light(ColorScheme colors) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colors.surface,

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        borderSide: BorderSide(color: colors.outline),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        borderSide: BorderSide(color: colors.outline),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        borderSide: BorderSide(color: colors.primary, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        borderSide: BorderSide(color: colors.error),
      ),
    );
  }

  static InputDecorationTheme dark(ColorScheme colors) {
    return light(colors);
  }
}
