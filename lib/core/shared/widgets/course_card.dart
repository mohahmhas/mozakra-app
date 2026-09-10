import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/router/routes.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/course/domain/entities/course_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CourseCard extends StatelessWidget {
  final CourseEntity course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(Routes.courseDetails, extra: course);
      },
      child: Column(
        children: [
          CardCoursImage(course: course),
          CoursCardDitails(course: course),
        ],
      ),
    );
  }
}

class CardCoursImage extends StatelessWidget {
  final CourseEntity course;
  const CardCoursImage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: AppSpacing.space192,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppRadius.radius20),
              topLeft: Radius.circular(AppRadius.radius20),
            ),
            // image: const DecorationImage(
            //   image: AssetImage('assets/images/course_placeholder.png'),
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        Positioned(
          top: 16.h,
          left: 282.w,
          right: 17.w,
          child: Container(
            width: 49.w,
            height: 24.h,

            decoration: BoxDecoration(
              color: context.courseCard.ratingBackground,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.svgStar, width: 13.w, height: 12.h),
                horizontalSpace(4),
                Text(
                  course.rating.toString(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CoursCardDitails extends StatelessWidget {
  final CourseEntity course;
  const CoursCardDitails({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: context.courseCard.cardBackground,
        boxShadow: [context.courseCard.shadow],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppRadius.radius20),
          bottomLeft: Radius.circular(AppRadius.radius20),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  course.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.title18BlodWhite.copyWith(
                    color: context.courseCard.titleColor,
                  ),
                ),
              ),

              horizontalSpace(8),

              Text(
                '${course.price.toStringAsFixed(2)} EGP',
                style: AppTextStyles.title18BlodWhite.copyWith(
                  color: context.courseCard.priceColor,
                ),
              ),
            ],
          ),
          verticalSpace(8),
          Row(
            children: [
              SvgPicture.asset(AppAssets.svgClock),
              horizontalSpace(4),
              Text(course.duration, style: context.textTheme.bodyMedium),
              horizontalSpace(16),
              SvgPicture.asset(AppAssets.svgStudents),
              horizontalSpace(4),
              Text(
                '1500 ${LocaleKeys.students.tr()}',
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundColor: context.courseCard.avatarBackground,
                child: Text(
                  course.instructor.name[0],
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: context.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              horizontalSpace(8),

              Text(
                course.instructor.name,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: context.courseCard.instructorTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
