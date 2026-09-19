import 'package:e_store/features/auth/domain/entities/user_entity.dart';
import 'package:e_store/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  Future<UserEntity> call() => _repository.getCurrentUser();
}