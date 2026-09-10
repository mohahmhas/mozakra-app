import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit() : super(CourseDetailsInitial());

  void toggleSection(String sectionId) {
    final currentState = state;
    if (currentState is CourseDetailsInitial) {
      final expandedSections = Set<String>.from(currentState.expandedSections);
      if (expandedSections.contains(sectionId)) {
        expandedSections.remove(sectionId);
      } else {
        expandedSections.add(sectionId);
      }
      emit(currentState.copyWith(expandedSections: expandedSections));
    }
  }
}
