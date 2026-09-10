import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:e_store/features/achievements/domain/entities/course_progress_entity.dart';
import 'package:flutter/material.dart';

class ProgressItem extends StatelessWidget {
  final CourseProgress course;

  const ProgressItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              course.title,
              style: AppTextStyles.title12Blod.copyWith(
                color: AppColors.darkBlue,
              ),
            ),
            Text(
              "${course.progress}%",
              style: AppTextStyles.title14SemiBlod.copyWith(
                fontWeight: FontWeightHelper.bold,
                color: AppColors.leanerEnd,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: 8,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: AppColors.chartBackground,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: course.progress,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.leanerMed, AppColors.leanerEnd],
                      ),
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        Text("Excellent design performance this month!"),
      ],
    );
  }
}
