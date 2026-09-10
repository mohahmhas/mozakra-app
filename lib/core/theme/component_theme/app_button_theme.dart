import 'package:flutter/material.dart';
import '../tokens/app_radius.dart';

class AppButtonTheme {
  AppButtonTheme._();

  static ElevatedButtonThemeData light(ColorScheme colors) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 56),
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        disabledBackgroundColor: colors.outline.withValues(alpha: .2),
        disabledForegroundColor: colors.onSurface.withValues(alpha: .4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.radius16),
        ),
      ),
    );
  }

  static ElevatedButtonThemeData dark(ColorScheme colors) {
    return light(colors);
  }
}
