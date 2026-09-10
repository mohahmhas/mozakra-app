class InstructorEntity {
  final String id;
  final String name;
  final String image;
  final String bio;
  final String specialization;
  final int totalStudents;
  final int totalCourses;
  final double rating;

  const InstructorEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.bio,
    required this.specialization,
    required this.totalStudents,
    required this.totalCourses,
    required this.rating,
  });
}
