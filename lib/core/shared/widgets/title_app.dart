import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          AppColors.leanerStart,
          AppColors.leanerMed,
          AppColors.leanerEnd,
        ],
      ).createShader(bounds),

      child: Text(LocaleKeys.appName.tr(), style: AppTextStyles.headlineLarge),
    );
  }
}
