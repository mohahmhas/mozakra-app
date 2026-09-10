import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/achievements/domain/entities/weekly_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyActivityChart extends StatelessWidget {
  final List<WeeklyActivity> data;

  const WeeklyActivityChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const chartHeight = 96.0;

    final maxValue = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: data.map((e) {
        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 24.w,
                height: chartHeight,
                margin: EdgeInsets.symmetric(horizontal: AppRadius.sm),
                decoration: BoxDecoration(
                  color: AppColors.chartBackground,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: e.value / maxValue,
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.leanerEnd,
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                e.day,
                style: AppTextStyles.title12SemiBlod.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
