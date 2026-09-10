import 'package:e_store/features/auth/domain/entities/user_entity.dart';

class CommentEntity {
  final String id;

  final UserEntity
   author;

  final String content;

  final DateTime createdAt;

  final int likesCount;

  final bool isLikedByMe;

  const CommentEntity({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
    required this.likesCount,
    required this.isLikedByMe,
  });
}