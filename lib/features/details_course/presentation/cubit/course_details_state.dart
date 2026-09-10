part of 'course_details_cubit.dart';

sealed class CourseDetailsState extends Equatable {
  const CourseDetailsState();

  @override
  List<Object> get props => [];
}

final class CourseDetailsInitial extends CourseDetailsState {
  final Set<String> expandedSections;
  const CourseDetailsInitial({this.expandedSections = const {}});

  CourseDetailsInitial copyWith({Set<String>? expandedSections}) {
    return CourseDetailsInitial(
      expandedSections: expandedSections ?? this.expandedSections,
    );
  }

  @override
  List<Object> get props => [expandedSections];
}
