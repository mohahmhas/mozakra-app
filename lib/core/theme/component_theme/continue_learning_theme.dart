import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:flutter/material.dart';

@immutable
class ContinueLearningTheme extends ThemeExtension<ContinueLearningTheme> {
  final Gradient backgroundGradient;

  final Color chipBackground;
  final Color chipText;

  final Color titleColor;
  final Color descriptionColor;

  final Color buttonBackground;
  final Color buttonText;
  final Color buttonIcon;

  final BorderRadius borderRadius;
  final BorderRadius buttonRadius;
  final BorderRadius chipRadius;

  final Color progressBackground;

  final Color progressValue;

  final Color progressText;

  const ContinueLearningTheme({
    required this.backgroundGradient,
    required this.chipBackground,
    required this.chipText,
    required this.titleColor,
    required this.descriptionColor,
    required this.buttonBackground,
    required this.buttonText,
    required this.buttonIcon,
    required this.borderRadius,
    required this.buttonRadius,
    required this.chipRadius,
    required this.progressBackground,
    required this.progressValue,
    required this.progressText,
  });

  @override
  ContinueLearningTheme copyWith({
    Gradient? backgroundGradient,
    Color? chipBackground,
    Color? chipText,
    Color? titleColor,
    Color? descriptionColor,
    Color? buttonBackground,
    Color? buttonText,
    Color? buttonIcon,
    Color? progressBackground,
    Color? progressValue,
    Color? progressText,
    BorderRadius? borderRadius,
    BorderRadius? buttonRadius,
    BorderRadius? chipRadius,
  }) {
    return ContinueLearningTheme(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      chipBackground: chipBackground ?? this.chipBackground,
      chipText: chipText ?? this.chipText,
      titleColor: titleColor ?? this.titleColor,
      descriptionColor: descriptionColor ?? this.descriptionColor,
      buttonBackground: buttonBackground ?? this.buttonBackground,
      buttonText: buttonText ?? this.buttonText,
      buttonIcon: buttonIcon ?? this.buttonIcon,
      borderRadius: borderRadius ?? this.borderRadius,
      buttonRadius: buttonRadius ?? this.buttonRadius,
      chipRadius: chipRadius ?? this.chipRadius,
      progressBackground: progressBackground ?? this.progressBackground,
      progressValue: progressValue ?? this.progressValue,
      progressText: progressText ?? this.progressText,
    );
  }

  @override
  ContinueLearningTheme lerp(
    covariant ThemeExtension<ContinueLearningTheme>? other,
    double t,
  ) {
    if (other is! ContinueLearningTheme) return this;

    return ContinueLearningTheme(
      backgroundGradient: Gradient.lerp(
        backgroundGradient,
        other.backgroundGradient,
        t,
      )!,
      chipBackground: Color.lerp(chipBackground, other.chipBackground, t)!,
      chipText: Color.lerp(chipText, other.chipText, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      descriptionColor: Color.lerp(
        descriptionColor,
        other.descriptionColor,
        t,
      )!,
      buttonBackground: Color.lerp(
        buttonBackground,
        other.buttonBackground,
        t,
      )!,

      buttonText: Color.lerp(buttonText, other.buttonText, t)!,
      buttonIcon: Color.lerp(buttonIcon, other.buttonIcon, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      buttonRadius: BorderRadius.lerp(buttonRadius, other.buttonRadius, t)!,
      chipRadius: BorderRadius.lerp(chipRadius, other.chipRadius, t)!,
      progressBackground: Color.lerp(
        progressBackground,
        other.progressBackground,
        t,
      )!,
      progressValue: Color.lerp(progressValue, other.progressValue, t)!,
      progressText: Color.lerp(progressText, other.progressText, t)!,
    );
  }
}

const lightContinueLearningTheme = ContinueLearningTheme(
  backgroundGradient: LinearGradient(
    colors: [AppColors.leanerEnd, AppColors.leanerMed],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),

  chipBackground: Color(0x33FFFFFF),
  chipText: Colors.white,

  titleColor: Colors.white,
  descriptionColor: Colors.white,

  buttonBackground: Colors.white,

  buttonText: AppColors.primary,
  buttonIcon: AppColors.primary,

  borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius20)),

  buttonRadius: BorderRadius.all(Radius.circular(AppRadius.radius12)),

  chipRadius: BorderRadius.all(Radius.circular(AppRadius.radius13)),
  progressBackground: Colors.white24,

  progressValue: Colors.white,

  progressText: Colors.white,
);

const darkContinueLearningTheme = ContinueLearningTheme(
  backgroundGradient: LinearGradient(
    colors: [AppColors.leanerEnd, AppColors.leanerMed],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),

  chipBackground: Color(0x33FFFFFF),

  chipText: Colors.white,

  titleColor: Colors.white,

  descriptionColor: Colors.white70,

  buttonBackground: Color(0xff334155),

  buttonText: Colors.white,

  buttonIcon: Colors.white,

  borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius20)),

  buttonRadius: BorderRadius.all(Radius.circular(AppRadius.radius12)),

  chipRadius: BorderRadius.all(Radius.circular(AppRadius.radius13)),
  progressBackground: Colors.white24,

  progressValue: Colors.white,

  progressText: Colors.white,
);
