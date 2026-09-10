import 'package:e_store/core/enums/reaction_type.dart';
import 'package:e_store/features/auth/domain/entities/user_entity.dart';

class UserReactionEntity {
 
  final UserEntity user;

  final ReactionType reactionType;

  final DateTime reactedAt;

  const UserReactionEntity({

    required this.user,
    required this.reactionType,
    required this.reactedAt,
  });
}
