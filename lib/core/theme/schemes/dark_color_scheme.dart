import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  primary: AppColors.primary,
  onPrimary: Colors.white,

  secondary: AppColors.secondary,
  onSecondary: Colors.white,

  primaryContainer: AppColors.leanerEnd,

  error: AppColors.error,
  onError: Colors.white,

  surface: AppColors.surfaceDark,
  onSurface: AppColors.white,

  outline: AppColors.gray700,
  outlineVariant: AppColors.gray800,

  shadow: Colors.black26,
  scrim: Colors.black54,

  inversePrimary: AppColors.gray600,
  inverseSurface: AppColors.gray100,

  surfaceContainer: AppColors.gray800,
  surfaceContainerHighest: AppColors.gray700,
);
