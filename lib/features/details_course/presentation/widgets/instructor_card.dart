import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/course/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InstructorCard extends StatelessWidget {
  final CourseEntity course;
  const InstructorCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(AppRadius.radius12),
          ),
          child: Text(
            course.instructor.name[0],
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        horizontalSpace(8.w),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.instructor.name,
                style: AppTextStyles.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                course.instructor.bio,
                style: AppTextStyles.bodyMedium.copyWith(height: 1.2),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              verticalSpace(8.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.svgStudents,
                    width: 16.w,
                    height: 12.h,
                    colorFilter: ColorFilter.mode(
                      AppColors.leanerEnd,
                      BlendMode.srcIn,
                    ),
                  ),
                  horizontalSpace(4.w),
                  Text(
                    '${course.instructor.totalStudents} students',

                    style: AppTextStyles.title12Blod.copyWith(
                      color: AppColors.leanerEnd,
                    ),
                  ),
                  horizontalSpace(8.w),
                  SvgPicture.asset(
                    AppAssets.svgCoursesBtBarIcon,
                    width: 13.w,
                    height: 13.h,
                    colorFilter: ColorFilter.mode(
                      AppColors.leanerEnd,
                      BlendMode.srcIn,
                    ),
                  ),
                  horizontalSpace(4.w),
                  Text(
                    '${course.instructor.totalCourses} courses',
                    style: AppTextStyles.title12Blod.copyWith(
                      color: AppColors.leanerEnd,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
