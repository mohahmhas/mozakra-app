import 'package:e_store/features/auth/domain/entities/user_entity.dart';

abstract class UserLocalDataSource {
  Future<void> saveUser(
      UserEntity user);

  Future<UserEntity?> getUser();
}