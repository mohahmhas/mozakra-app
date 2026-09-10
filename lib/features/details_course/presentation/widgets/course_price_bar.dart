import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/shared/widgets/app_button.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/course/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursePriceBar extends StatelessWidget {
  final CourseEntity course;
  const CoursePriceBar({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),

      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),

      child: Row(
        children: [
          /// PRICE
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Course Price',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),

                verticalSpace(4),

                if (course.discountPrice != null)
                  Row(
                    children: [
                      Text(
                        '\$${course.discountPrice}',
                        style: AppTextStyles.title24SemiBlod.copyWith(
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        '\$${course.price}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  )
                else
                  Text(
                    '\$${course.price}',
                    style: AppTextStyles.title24SemiBlod.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
              ],
            ),
          ),

          /// BUTTON
          AppButton(
            width: 210.w,

            text: course.isEnrolled ? 'Continue Learning' : 'Enroll Now',

            onPressed: () {
              if (course.isEnrolled) {
                /// Go To Lessons
              } else {
                /// Payment Screen
              }
            },
          ),
        ],
      ),
    );
  }
}
