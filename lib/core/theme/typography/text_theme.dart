import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/helpers/font_weight_helper.dart';

class AppTextTheme {
  AppTextTheme._();

  static final TextStyle _base = GoogleFonts.cairo(
    height: 1.4,
  );

  static final TextTheme light = TextTheme(
    // =========================
    // DISPLAY
    // =========================

    displayLarge: _base.copyWith(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold,
    ),

    displayMedium: _base.copyWith(
      fontSize: 28.sp,
      fontWeight: FontWeightHelper.bold,
    ),

    displaySmall: _base.copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
    ),

    // =========================
    // HEADLINE
    // =========================

    headlineLarge: _base.copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
    ),

    headlineMedium: _base.copyWith(
      fontSize: 22.sp,
      fontWeight: FontWeightHelper.semiBold,
    ),

    headlineSmall: _base.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.semiBold,
    ),

    // =========================
    // TITLE
    // =========================

    titleLarge: _base.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.semiBold,
    ),

    titleMedium: _base.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.semiBold,
    ),

    titleSmall: _base.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.semiBold,
    ),

    // =========================
    // BODY
    // =========================

    bodyLarge: _base.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
    ),

    bodyMedium: _base.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
    ),

    bodySmall: _base.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular,
    ),

    // =========================
    // LABEL
    // =========================

    labelLarge: _base.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.medium,
    ),

    labelMedium: _base.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.medium,
    ),

    labelSmall: _base.copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeightHelper.medium,
    ),
  );

  static final TextTheme dark = light;
}