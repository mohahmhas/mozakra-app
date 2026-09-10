import 'package:e_store/features/details_course/domain/entities/course_section_entity.dart';
import 'package:e_store/features/details_course/domain/entities/review_entity.dart';
import 'package:e_store/features/profile/domain/entities/instructor_entity.dart';

class CourseEntity {
  final String id;

  final String title;

  final String image;

  final InstructorEntity instructor;
  final List<CourseSectionEntity> sections;

  final List<ReviewEntity> reviews;

  final double price;

  final int students;

  final String duration;

  final String description;

  final String language;

  final String level;

  final double rating;

  final bool isEnrolled;

  final bool isFavorite;

  final double? discountPrice;

  const CourseEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.instructor,
    required this.price,
    required this.students,
    required this.duration,
    required this.description,
    required this.sections,
    required this.reviews,
    required this.language,
    required this.level,
    required this.rating,
    required this.isEnrolled,
    required this.isFavorite,
    this.discountPrice,
  });
}
