import 'package:flutter/material.dart';
import '../tokens/app_radius.dart';

class AppBottomSheetTheme {
  AppBottomSheetTheme._();

  static BottomSheetThemeData light(ColorScheme colors) {
    return BottomSheetThemeData(
      backgroundColor: colors.surface,
      modalBackgroundColor: colors.surface,
      showDragHandle: true,
      dragHandleColor: colors.outline,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.radius12),
        ),
      ),
    );
  }

  static BottomSheetThemeData dark(ColorScheme colors) {
    return light(colors);
  }
}
