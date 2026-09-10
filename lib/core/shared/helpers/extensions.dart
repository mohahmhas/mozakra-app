import 'package:e_store/core/theme/component_theme/continue_learning_theme.dart';
import 'package:e_store/core/theme/component_theme/course_card_theme.dart';
import 'package:e_store/core/theme/extensions/ai_assistant_colors.dart';
import 'package:e_store/core/theme/extensions/bottom_navigation_theme.dart';
import 'package:e_store/core/theme/extensions/gradient_theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:timeago/timeago.dart' as timeago;

extension ContextExtension on BuildContext {
  bool get isArabic => locale.languageCode == 'ar';
}

extension AppThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  Color get background => theme.scaffoldBackgroundColor;

  Color get colorsBorder => Theme.of(this).colorScheme.outline;

  Color get surface => Theme.of(this).colorScheme.surface;

  Color get onSurface => Theme.of(this).colorScheme.onSurface;

  Color get primary => Theme.of(this).colorScheme.primary;
  Color get divider => Theme.of(this).dividerColor;

  Color get error => Theme.of(this).colorScheme.error;

  //extensions
  BottomNavTheme get bottomNav => Theme.of(this).extension<BottomNavTheme>()!;

  GradientTheme get gradients => theme.extension<GradientTheme>()!;

  AIAssistantTheme get aiAssistant => theme.extension<AIAssistantTheme>()!;
  ContinueLearningTheme get continueLearning =>
      Theme.of(this).extension<ContinueLearningTheme>()!;
      
  CourseCardTheme get courseCard =>
      Theme.of(this).extension<CourseCardTheme>()!;
}

extension AppTextColor on BuildContext {
  Color get textPrimary => colors.onSurface;

  Color get textHint => colors.onSurface.withValues(alpha: .5);
}

extension DateTimeExtension on DateTime {
  String timeAgo({String locale = 'en'}) {
    return timeago.format(this, locale: locale);
  }
}
