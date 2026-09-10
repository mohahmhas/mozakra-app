import 'package:e_store/core/theme/component_theme/app_appbar_theme.dart';
import 'package:e_store/core/theme/component_theme/app_bottom_sheet_theme.dart';
import 'package:e_store/core/theme/component_theme/app_button_theme.dart';
import 'package:e_store/core/theme/component_theme/app_card_theme.dart';
import 'package:e_store/core/theme/component_theme/app_chip_theme.dart';
import 'package:e_store/core/theme/component_theme/app_input_theme.dart';
import 'package:e_store/core/theme/component_theme/continue_learning_theme.dart';
import 'package:e_store/core/theme/component_theme/course_card_theme.dart';
import 'package:e_store/core/theme/extensions/ai_assistant_colors.dart';
import 'package:e_store/core/theme/extensions/bottom_navigation_theme.dart';
import 'package:flutter/material.dart';

import 'schemes/dark_color_scheme.dart';
import 'schemes/light_color_scheme.dart';

import 'typography/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: lightColorScheme.surface,

      textTheme: AppTextTheme.light,

      appBarTheme: AppAppBarTheme.light(lightColorScheme),

      elevatedButtonTheme: AppButtonTheme.light(lightColorScheme),

      inputDecorationTheme: AppInputTheme.light(lightColorScheme),

      cardTheme: AppCardTheme.light(lightColorScheme),

      chipTheme: AppChipTheme.light(lightColorScheme),

      bottomSheetTheme: AppBottomSheetTheme.light(lightColorScheme),

      extensions: const [
        lightContinueLearningTheme,
        lightCourseCardTheme,
        lightBottomNavTheme,
        lightAIAssistantTheme,
        //  lightGradientTheme
      ],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      colorScheme: darkColorScheme,
      scaffoldBackgroundColor: darkColorScheme.surface,

      textTheme: AppTextTheme.dark,

      appBarTheme: AppAppBarTheme.dark(darkColorScheme),

      elevatedButtonTheme: AppButtonTheme.dark(darkColorScheme),

      inputDecorationTheme: AppInputTheme.dark(darkColorScheme),

      cardTheme: AppCardTheme.dark(darkColorScheme),

      chipTheme: AppChipTheme.dark(darkColorScheme),

      bottomSheetTheme: AppBottomSheetTheme.dark(darkColorScheme),

      extensions: const [
        darkContinueLearningTheme,
        darkCourseCardTheme,
        darkBottomNavTheme,
        darkAIAssistantTheme,
        // darkAchievementTheme,

        // darkStatisticsTheme,

        // darkBadgeTheme,

        // darkChartTheme,

        // darkGradientTheme,

        // darkAIAssistantTheme,

        // darkCourseStatusTheme,
      ],
    );
  }
}
