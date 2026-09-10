import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/features/course/domain/entities/course_entity.dart';
import 'package:e_store/features/details_course/presentation/cubit/course_details_cubit.dart';
import 'package:e_store/features/details_course/presentation/widgets/course_section_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

class CourseSectionsList extends StatelessWidget {
  final CourseEntity course;
  const CourseSectionsList({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: course.sections.length,
          separatorBuilder: (context, index) => verticalSpace(12),
          itemBuilder: (context, index) {
            final section = course.sections[index];
            // final isExpanded = state.expandedSections;
            return CourseSectionTile(
              section: section,
              isExpanded:
                  state is CourseDetailsInitial &&
                  state.expandedSections.contains(section.id),
            );
          },
        );
      },
    );
  }
}
