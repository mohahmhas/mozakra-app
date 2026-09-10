import 'package:flutter/material.dart';

@immutable
class GradientTheme extends ThemeExtension<GradientTheme> {
  final LinearGradient primary;
  final LinearGradient secondary;
  final LinearGradient ai;
  final LinearGradient achievement;

  const GradientTheme({
    required this.primary,
    required this.secondary,
    required this.ai,
    required this.achievement,
  });

  @override
  GradientTheme copyWith({
    LinearGradient? primary,
    LinearGradient? secondary,
    LinearGradient? ai,
    LinearGradient? achievement,
  }) {
    return GradientTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      ai: ai ?? this.ai,
      achievement: achievement ?? this.achievement,
    );
  }

  @override
  GradientTheme lerp(
    covariant ThemeExtension<GradientTheme>? other,
    double t,
  ) {
    if (other is! GradientTheme) return this;

    return GradientTheme(
      primary: t < 0.5 ? primary : other.primary,
      secondary: t < 0.5 ? secondary : other.secondary,
      ai: t < 0.5 ? ai : other.ai,
      achievement: t < 0.5 ? achievement : other.achievement,
    );
  }
}
const lightGradientTheme = GradientTheme(

  primary: LinearGradient(
    colors: [
      Color(0xFF0058BE),
      Color(0xFF4648D4),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),

  secondary: LinearGradient(
    colors: [
      Color(0xFF3B82F6),
      Color(0xFF6366F1),
    ],
  ),

  ai: LinearGradient(
    colors: [
      Color(0xFF7C3AED),
      Color(0xFFA855F7),
    ],
  ),

  achievement: LinearGradient(
    colors: [
      Color(0xFFF59E0B),
      Color(0xFFFBBF24),
    ],
  ),
);

const darkGradientTheme = GradientTheme(
  primary: LinearGradient(
    colors: [
      Color(0xFF0058BE),
      Color(0xFF4648D4),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),

  secondary: LinearGradient(
    colors: [
      Color(0xFF2563EB),
      Color(0xFF4F46E5),
    ],
  ),

  ai: LinearGradient(
    colors: [
      Color(0xFF6D28D9),
      Color(0xFF9333EA),
    ],
  ),

  achievement: LinearGradient(
    colors: [
      Color(0xFFD97706),
      Color(0xFFF59E0B),
    ],
  ),
);