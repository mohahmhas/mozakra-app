import 'package:e_store/features/auth/data/models/login_request_model.dart';
import 'package:e_store/features/auth/data/models/login_response_model.dart';
import 'package:e_store/features/auth/data/models/register_request_model.dart';
import 'package:e_store/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestModel request);
  Future<AuthResponseModel> register(RegisterRequestModel request);
  Future<RefreshResponseModel> refreshToken();
  Future<void> logout();
  Future<UserModel> getCurrentUser();
}
