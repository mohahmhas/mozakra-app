import 'package:e_store/core/storage/secure_storage_service.dart';
import 'package:e_store/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_store/features/auth/data/models/login_request_model.dart';
import 'package:e_store/features/auth/data/models/register_request_model.dart';
import 'package:e_store/features/auth/domain/entities/user_entity.dart';
import 'package:e_store/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorageService _secureStorage;
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required SecureStorageService secureStorage,
  }) : _remoteDataSource = remoteDataSource,
       _secureStorage = secureStorage;
  @override
  Future<UserEntity> getCurrentUser() async {
    final response = await _remoteDataSource.getCurrentUser();
    return response.toEntity();
  }

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final request = LoginRequestModel(email: email, password: password);
    final response = await _remoteDataSource.login(request);
    await _secureStorage.saveAccessToken(response.accessToken);
    return response.user.toEntity();
  }

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } finally {
      await _secureStorage.deleteAccessToken();
    }
  }

  @override
  Future<String> refreshToken() async {
    final response = await _remoteDataSource.refreshToken();
    await _secureStorage.saveAccessToken(response.accessToken);
    return response.accessToken;
  }

  @override
  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final request = RegisterRequestModel(
      name: name,
      email: email,
      password: password,
    );
    final response = await _remoteDataSource.register(request);
    await _secureStorage.saveAccessToken(response.accessToken);
    return response.user.toEntity();
  }
}
