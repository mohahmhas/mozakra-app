import 'package:e_store/features/auth/domain/entities/user_entity.dart';
import 'package:e_store/features/community/domain/entities/user_reaction_entity.dart';

class PostEntity {
  final String id;
  final UserEntity author;
  final String groupName;
  final String post;

  final int likesCount;
  final int commentsCount;
  final int sharesCount;

  final bool isLikedByMe;

  final DateTime createdAt;

  final List<UserReactionEntity> recentReactions;

  PostEntity({
    required this.id,
    required this.author,
    required this.groupName,
    required this.post,

    required this.likesCount,
    required this.commentsCount,
    required this.sharesCount,
    required this.isLikedByMe,
    required this.createdAt,
    required this.recentReactions,
  });
}
