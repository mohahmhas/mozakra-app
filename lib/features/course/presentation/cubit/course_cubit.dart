import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_store/core/enums/lesson_tabs_enums.dart';
import 'package:equatable/equatable.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseTapChanged(CourseDetailsTab.content));

  CourseDetailsTab selectedTab = CourseDetailsTab.content;

  void changeTab(CourseDetailsTab tab) {
    if (selectedTab == tab) return;
    selectedTab = tab;
    emit(CourseTapChanged(tab));
  }
}
