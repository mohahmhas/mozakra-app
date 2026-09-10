part of 'course_cubit.dart';

sealed class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

final class CourseInitial extends CourseState {
  final int index = 0;
  @override
  List<Object> get props => [index];
}

final class CourseTapChanged extends CourseState {
  final CourseDetailsTab selectedTap;
  const CourseTapChanged(this.selectedTap);
  @override
  List<Object> get props => [selectedTap];
}
