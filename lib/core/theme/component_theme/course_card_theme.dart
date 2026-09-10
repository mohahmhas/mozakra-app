import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class CourseCardTheme extends ThemeExtension<CourseCardTheme> {
  final Color imageBackground;

  final Color cardBackground;

  final Color titleColor;

  final Color priceColor;

  final Color instructorTextColor;

  final Color ratingBackground;

  final Color ratingText;

  final Color avatarBackground;
  final BoxShadow shadow;

  const CourseCardTheme({
    required this.imageBackground,
    required this.cardBackground,
    required this.titleColor,
    required this.priceColor,
    required this.instructorTextColor,
    required this.ratingBackground,
    required this.ratingText,
    required this.avatarBackground,
    required this.shadow,
  });

  @override
  CourseCardTheme copyWith({
    Color? imageBackground,
    Color? cardBackground,
    Color? titleColor,
    Color? priceColor,
    Color? infoColor,
    Color? instructorTextColor,
    Color? ratingBackground,
    Color? ratingText,
    Color? avatarBackground,
    BoxShadow? shadow,
  }) {
    return CourseCardTheme(
      imageBackground: imageBackground ?? this.imageBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      titleColor: titleColor ?? this.titleColor,
      priceColor: priceColor ?? this.priceColor,
      instructorTextColor: instructorTextColor ?? this.instructorTextColor,
      ratingBackground: ratingBackground ?? this.ratingBackground,
      ratingText: ratingText ?? this.ratingText,
      avatarBackground: avatarBackground ?? this.avatarBackground,
      shadow: shadow ?? this.shadow,
    );
  }

  //lerp
  @override
  ThemeExtension<CourseCardTheme> lerp(
    ThemeExtension<CourseCardTheme>? other,
    double t,
  ) {
    if (other is! CourseCardTheme) return this;
    return CourseCardTheme(
      imageBackground: Color.lerp(imageBackground, other.imageBackground, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      priceColor: Color.lerp(priceColor, other.priceColor, t)!,
      instructorTextColor: Color.lerp(
        instructorTextColor,
        other.instructorTextColor,
        t,
      )!,
      ratingBackground: Color.lerp(
        ratingBackground,
        other.ratingBackground,
        t,
      )!,
      ratingText: Color.lerp(ratingText, other.ratingText, t)!,
      avatarBackground: Color.lerp(
        avatarBackground,
        other.avatarBackground,
        t,
      )!,
      shadow: BoxShadow.lerp(shadow, other.shadow, t)!,
    );
  }
}

const lightCourseCardTheme = CourseCardTheme(
  imageBackground: AppColors.primary,

  cardBackground: Colors.white,

  titleColor: AppColors.textPrimaryLight,

  priceColor: AppColors.primary,

  instructorTextColor: AppColors.textPrimaryLight,

  ratingBackground: Colors.white,

  ratingText: AppColors.textPrimaryLight,

  avatarBackground: Colors.grey,
  shadow: BoxShadow(
    color: Color(0x40000000), // black 10%
    blurRadius: 2,
    offset: Offset(0, 1),
  ),
);
const darkCourseCardTheme = CourseCardTheme(
  imageBackground: Color(0xff2563EB),

  cardBackground: Color(0xff1E293B),

  titleColor: Colors.white,

  priceColor: Color(0xff60A5FA),

  instructorTextColor: Colors.white,

  ratingBackground: Color(0xff334155),

  ratingText: Colors.white,

  avatarBackground: Color(0xff475569),
  shadow: BoxShadow(
    color: Color(0x33000000),
    blurRadius: 20,
    offset: Offset(0, 1),
  ),
);
