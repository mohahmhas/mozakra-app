class CourseLessonEntity {
  final String id;

  final String title;

  final String duration;

  final String sectionId;

  final bool isPreview;

  const CourseLessonEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.sectionId,
    required this.isPreview,
  });
}
