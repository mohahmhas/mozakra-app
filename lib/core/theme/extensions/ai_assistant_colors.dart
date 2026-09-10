import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:flutter/material.dart';

@immutable
class AIAssistantTheme extends ThemeExtension<AIAssistantTheme> {
  final Gradient backgroundGradient;
  final Color titleColor;
  final Color descriptionColor;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final Color illustrationColor;

  final BorderRadius borderRadius;

  const AIAssistantTheme({
    required this.backgroundGradient,
    required this.titleColor,
    required this.descriptionColor,
    required this.buttonBackgroundColor,
    required this.buttonTextColor,
    required this.illustrationColor,
    required this.borderRadius,
  });

  @override
  ThemeExtension<AIAssistantTheme> copyWith({
    Gradient? backgroundGradient,
    Color? titleColor,
    Color? descriptionColor,
    Color? buttonBackgroundColor,
    Color? buttonTextColor,
    Color? illustrationColor,
    BorderRadius? borderRadius,
  }) {
    return AIAssistantTheme(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      titleColor: titleColor ?? this.titleColor,
      descriptionColor: descriptionColor ?? this.descriptionColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      illustrationColor: illustrationColor ?? this.illustrationColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<AIAssistantTheme> lerp(
    covariant ThemeExtension<AIAssistantTheme>? other,
    double t,
  ) {
    if (other is! AIAssistantTheme) return this;

    return AIAssistantTheme(
      backgroundGradient: Gradient.lerp(
        backgroundGradient,
        other.backgroundGradient,
        t,
      )!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      descriptionColor: Color.lerp(
        descriptionColor,
        other.descriptionColor,
        t,
      )!,
      buttonBackgroundColor: Color.lerp(
        buttonBackgroundColor,
        other.buttonBackgroundColor,
        t,
      )!,
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t)!,
      illustrationColor: Color.lerp(
        illustrationColor,
        other.illustrationColor,
        t,
      )!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
    );
  }
}

const lightAIAssistantTheme = AIAssistantTheme(
  backgroundGradient: LinearGradient(
    colors: [AppColors.leanerMed, AppColors.leanerStartAssestantBox],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  titleColor: Colors.white,
  descriptionColor: Colors.white,
  buttonBackgroundColor: Colors.white,
  buttonTextColor: AppColors.leanerEnd,
  illustrationColor: Color(0x80FFFFFF),
  borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius24)),
);

const darkAIAssistantTheme = AIAssistantTheme(
  backgroundGradient: LinearGradient(
    colors: [AppColors.leanerMed, AppColors.leanerStartAssestantBox],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  titleColor: Colors.white,
  descriptionColor: Colors.white,
  buttonBackgroundColor: Colors.white,
  buttonTextColor: AppColors.leanerEnd,
  illustrationColor: Color(0x80FFFFFF),
  borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius24)),
);
