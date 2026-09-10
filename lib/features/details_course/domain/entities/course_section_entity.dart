import 'package:e_store/features/details_course/domain/entities/course_lesson_entity.dart';

class CourseSectionEntity {
  final String id;

  final String title;

  final List<CourseLessonEntity> lessons;

  const CourseSectionEntity({
    required this.id,
    required this.title,
    required this.lessons,
  });
}
