import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/course/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CourseHeaderInfo extends StatelessWidget {
  final CourseEntity course;
  const CourseHeaderInfo({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 26.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.radius12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.50),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              course.level,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        horizontalSpace(8),
        SvgPicture.asset(AppAssets.svgStar, width: 13.w, height: 13.h),
        horizontalSpace(4),
        Text(
          course.rating.toString(),
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
