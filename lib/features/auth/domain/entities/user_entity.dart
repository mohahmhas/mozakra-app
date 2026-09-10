import 'package:e_store/core/enums/user_rols.dart';

class UserEntity{
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final UserRole role;

  final String? bio;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.role,
    this.bio,
  });
}
