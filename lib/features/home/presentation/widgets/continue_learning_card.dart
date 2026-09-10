import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/home/data/model/continue_learning_course.dart';
import 'package:e_store/features/home/presentation/widgets/course_progress_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContinueLearningCard extends StatelessWidget {
  const ContinueLearningCard({super.key, required this.course, this.onTap});

  final ContinueLearningCourse course;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 224.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        gradient: context.continueLearning.backgroundGradient,
        borderRadius: BorderRadius.circular(AppRadius.radius20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Progress Badge
          Container(
            width: 55.w,
            height: 24.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.continueLearning.chipBackground,
              borderRadius: BorderRadius.circular(AppRadius.radius13),
            ),
            child: Text(
              LocaleKeys.progress.tr(),
              style: context.textTheme.labelMedium?.copyWith(
                color: context.continueLearning.chipText,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          ),

          SizedBox(height: 4.h),

          /// Title
          Text(
            course.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.continueLearning.titleColor,
            ),
          ),

          SizedBox(height: 4.h),

          /// Description
          Text(
            course.decription,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.continueLearning.descriptionColor,
            ),
          ),

          verticalSpace(20.h),

          /// Progress Bar
          CourseProgressBar(progress: course.progress),

          verticalSpace(20.h),

          /// Continue Button
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppRadius.radius12),
            child: Container(
              width: 161.w,
              height: 42.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: context.continueLearning.buttonBackground,
                borderRadius: BorderRadius.circular(AppRadius.radius12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.svgPlayer,
                    width: 16.w,
                    height: 16.h,
                    colorFilter: ColorFilter.mode(
                      context.continueLearning.buttonIcon,
                      BlendMode.srcIn,
                    ),
                  ),

                  SizedBox(width: 8.w),

                  Text(
                    LocaleKeys.continueText.tr(),
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.continueLearning.buttonText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
