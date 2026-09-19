import 'package:e_store/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_store/features/auth/data/models/login_request_model.dart';
import 'package:e_store/features/auth/data/models/register_request_model.dart';
import 'package:e_store/features/auth/domain/entities/user_entity.dart';
import 'package:e_store/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;
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
    return response.user.toEntity();
  }

  @override
  Future<void> logout() async {
    await _remoteDataSource.logout();
  }

  @override
  Future<String> refreshToken() async {
    final response = await _remoteDataSource.refreshToken();
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
    return response.user.toEntity();
  }
}
