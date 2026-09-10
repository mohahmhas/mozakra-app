import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AiAssistantContainer extends StatelessWidget {
  const AiAssistantContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppSpacing.space350,
          height: AppSpacing.space190,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: context.aiAssistant.borderRadius,
            gradient: context.aiAssistant.backgroundGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.doYouNeedHelp.tr(),
                style: context.theme.textTheme.headlineLarge?.copyWith(
                  color: context.aiAssistant.titleColor,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              SizedBox(height: AppSpacing.space4),
              Text(
                LocaleKeys.askOurSmartAssistantAboutCourses.tr(),
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.aiAssistant.descriptionColor,
                  height: 1.5,
                ),
              ),
              SizedBox(height: AppSpacing.space16),

              Container(
                width: 270.w,
                height: 45.h,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.space21,
                  vertical: AppSpacing.space10,
                ),
                decoration: BoxDecoration(
                  color: context.aiAssistant.buttonBackgroundColor,
                  borderRadius: BorderRadius.circular(AppRadius.radius20),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      height: 19.h,
                      AppAssets.svgSmartAssistant,
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(width: AppSpacing.space8),
                    Text(
                      LocaleKeys.talkWithAssistant.tr(),
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        color: context.colors.primaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 70,
          left: 3,
          child: SizedBox(
            width: 95,
            height: 100,
            child: SvgPicture.asset(
              fit: BoxFit.scaleDown,
              context.isArabic
                  ? AppAssets.svgHumanAssestAr
                  : AppAssets.svgHumanAssestEn,
              colorFilter: ColorFilter.mode(
                context.aiAssistant.illustrationColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
