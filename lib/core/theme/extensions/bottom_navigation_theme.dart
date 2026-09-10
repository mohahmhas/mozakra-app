
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class BottomNavTheme extends  ThemeExtension<BottomNavTheme> {
   final Color background;

  final Color selectedBackground;

  final Color selectedIcon;

  final Color unselectedIcon;

  final Color selectedText;

  final Color unselectedText;

  final BoxShadow shadow;

  final BorderRadius borderRadius;

  const BottomNavTheme({
    required this.background,
    required this.selectedBackground,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.selectedText,
    required this.unselectedText,
    required this.shadow,
    required this.borderRadius,
  });


  
  @override
  ThemeExtension<BottomNavTheme> copyWith({
    Color? background,
    Color? selectedBackground,
    Color? selectedIcon,
    Color? unselectedIcon,
    Color? selectedText,
    Color? unselectedText,
    BoxShadow? shadow,
    BorderRadius? borderRadius,
  }){
    return BottomNavTheme(
      background: background ?? this.background,
      selectedBackground: selectedBackground ?? this.selectedBackground,
      selectedIcon: selectedIcon ?? this.selectedIcon,
      unselectedIcon: unselectedIcon ?? this.unselectedIcon,
      selectedText: selectedText ?? this.selectedText,
      unselectedText: unselectedText ?? this.unselectedText,
      shadow: shadow ?? this.shadow,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
  
  @override
  ThemeExtension<BottomNavTheme> lerp(covariant ThemeExtension<BottomNavTheme>? other, double t) {
    if (other is! BottomNavTheme) return this;
    return BottomNavTheme(
      background: Color.lerp(background, other.background, t)!,
      selectedBackground: Color.lerp(selectedBackground, other.selectedBackground, t)!,
      selectedIcon: Color.lerp(selectedIcon, other.selectedIcon, t)!,
      unselectedIcon: Color.lerp(unselectedIcon, other.unselectedIcon, t)!,
      selectedText: Color.lerp(selectedText, other.selectedText, t)!,
      unselectedText: Color.lerp(unselectedText, other.unselectedText, t)!,
      shadow: BoxShadow.lerp(shadow, other.shadow, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
    );
  }
}

const lightBottomNavTheme = BottomNavTheme(
  background: AppColors.surfaceLight,

  selectedBackground: Color(0x332170E4),

  selectedIcon: AppColors.leanerEnd,

  unselectedIcon: AppColors.grey,

  selectedText: AppColors.leanerEnd,

  unselectedText: AppColors.grey,

  shadow: BoxShadow(
    color: Colors.black12,
    blurRadius: 20,
    offset: Offset(0, -2),
  ),

  borderRadius: BorderRadius.all(
    Radius.circular(16),
  ),
);

const darkBottomNavTheme = BottomNavTheme(
  background: AppColors.surfaceDark,

  selectedBackground: Color(0x333B82F6),

  selectedIcon: AppColors.primary,

  unselectedIcon: AppColors.gray100,

  selectedText: AppColors.primary,

  unselectedText: AppColors.gray100,

  shadow: BoxShadow(
    color: Colors.black38,
    blurRadius: 20,
    offset: Offset(0, -2),
  ),

  borderRadius: BorderRadius.all(
    Radius.circular(16),
  ),
);