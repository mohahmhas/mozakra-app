import 'package:e_store/core/enums/lesson_tabs_enums.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/course/presentation/cubit/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseLessonTabs extends StatelessWidget {
  const CourseLessonTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        final cubit = context.watch<CourseCubit>();
        return Row(
          children: [
            _tabItem(
              context,
              title: 'Content',
              tab: CourseDetailsTab.content,
              selected: cubit.selectedTab == CourseDetailsTab.content,
            ),
            _tabItem(
              context,
              title: 'Notes',
              tab: CourseDetailsTab.notes,
              selected: cubit.selectedTab == CourseDetailsTab.notes,
            ),
            _tabItem(
              context,
              title: 'Resources',
              tab: CourseDetailsTab.resources,
              selected: cubit.selectedTab == CourseDetailsTab.resources,
            ),
          ],
        );
      },
    );
  }

  Widget _tabItem(
    BuildContext context, {
    required String title,
    required CourseDetailsTab tab,
    required bool selected,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          context.read<CourseCubit>().changeTab(tab);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? context.primary: Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.title18SemiBlod.copyWith(
              color: selected ? context.primary : context.primary,
            ),
          ),
        ),
      ),
    );
  }
}
