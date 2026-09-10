import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/onboarding_completed/data/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageView extends StatelessWidget {
  final OnboardingItem onboardingItem;
  const OnboardingPageView({super.key, required this.onboardingItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(onboardingItem.image, width: 320.w, height: 320.h),
        verticalSpace(31),
        Text(
          onboardingItem.title,
          style: AppTextStyles.title28Blod.copyWith(color: AppColors.darkBlue),
        ),
        verticalSpace(16),
        Text(
          onboardingItem.subtitle,
          style: AppTextStyles.bodyLarge.copyWith(color: AppColors.darkGrey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
