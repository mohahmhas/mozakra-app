import 'package:flutter/material.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData light(ColorScheme colors) {
    return ChipThemeData(
      backgroundColor: colors.surfaceContainer,
      selectedColor: colors.primary,
      disabledColor: colors.outline.withValues(alpha: .2),
      checkmarkColor: colors.onPrimary,
      side: BorderSide(
        color: colors.outline,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  static ChipThemeData dark(ColorScheme colors) {
    return light(colors);
  }
}