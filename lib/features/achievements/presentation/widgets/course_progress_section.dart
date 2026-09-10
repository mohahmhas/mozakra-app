import 'package:e_store/features/achievements/domain/entities/course_progress_entity.dart';
import 'package:e_store/features/achievements/presentation/widgets/progress_item.dart';
import 'package:flutter/material.dart';

class CourseProgressSection extends StatelessWidget {
  final List<CourseProgress> courses;

  const CourseProgressSection({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Column(
            children: courses
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ProgressItem(course: e),
                  ),
                )
                .toList(),
          ),
          Text(
            "Excellent +//here i want write name course have best progress + performance this month!",
          ),
        ],
      ),
    );
  }
}
