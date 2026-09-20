import '../repositories/auth_repository.dart';

class RefreshTokenUseCase {
  RefreshTokenUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  Future<String> call() {
    return _repository.refreshToken();
  }
}
