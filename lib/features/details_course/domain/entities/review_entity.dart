class ReviewEntity {
  final String id;

  final String userName;

  final String userImage;

  final String comment;

  final double rating;

  final String time;

  const ReviewEntity({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.comment,
    required this.rating,
    required this.time,
  });
}
