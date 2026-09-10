import 'package:e_store/features/home/data/model/continue_learning_course.dart';
import 'package:e_store/features/home/presentation/widgets/continue_learning_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueLearningSection extends StatelessWidget {
  const ContinueLearningSection({super.key, required this.courses});

  final List<ContinueLearningCourse> courses;

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 230.h,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        itemCount: courses.length,

        separatorBuilder: (_, _) => SizedBox(width: 16.w),

        itemBuilder: (context, index) {
          return ContinueLearningCard(course: courses[index]);
        },
      ),
    );
  }
}
