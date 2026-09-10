import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseProgressBar extends StatelessWidget {
  const CourseProgressBar({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),

                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: context.continueLearning.progressBackground,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.continueLearning.progressValue,
                  ),
                ),
              ),
            ),

            SizedBox(width: 8.w),

            Text(
              '${(progress * 100).toInt()}%',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.continueLearning.progressText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
