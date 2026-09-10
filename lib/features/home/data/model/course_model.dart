class CourseModel {
  final String id;

  final String title;

  final String image;

  final String instructor;

  final int lessons;

  final int duration;

  final double progress;

  final bool isCompleted;

  const CourseModel({
    required this.id,
    required this.title,
    required this.image,
    required this.instructor,
    required this.lessons,
    required this.duration,
    required this.progress,
    required this.isCompleted,
  });
}
