import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: AppColors.primary,
  onPrimary: Colors.white,
 

  primaryContainer: AppColors.leanerEnd,

  secondary: AppColors.secondary,
  onSecondary: Colors.white,

  error: AppColors.error,
  onError: Colors.white,

  surface: AppColors.surfaceLight,
  onSurface: AppColors.onSurfaceLight,

  outline: AppColors.outline,
  outlineVariant: AppColors.outlineVariant,

  shadow: Colors.black26,
  scrim: Colors.black54,

  inversePrimary: AppColors.inversePrimary,
  inverseSurface: AppColors.inverseSurface,

  surfaceContainer: AppColors.surfaceContainer,
  surfaceContainerHighest: AppColors.surfaceContainerHighest,
);
