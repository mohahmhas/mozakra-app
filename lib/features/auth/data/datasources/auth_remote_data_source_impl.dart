import 'package:e_store/core/network/api_client.dart';
import 'package:e_store/core/network/interceptors/auth_interceptor.dart';
import 'package:e_store/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_store/features/auth/data/models/login_request_model.dart';
import 'package:e_store/features/auth/data/models/login_response_model.dart';
import 'package:e_store/features/auth/data/models/register_request_model.dart';
import 'package:e_store/features/auth/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required ApiClient apiClient})
    : _apiClient = apiClient;
  final ApiClient _apiClient;

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
  final response = await _apiClient.post<Map<String, dynamic>>( 
    '/auth/login', 
    data: request.toJson(), 
    extra: { AuthInterceptor.requiresAuthKey: false, },
     ); 
    return AuthResponseModel.fromJson( response.data!, );  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await _apiClient.get<Map<String, dynamic>>( '/auth/me', );
     final data = response.data!['data'] as Map<String, dynamic>;
     return UserModel.fromJson(data);
  }

  @override
  Future<void> logout() async{
   await _apiClient.post<Map<String, dynamic>>(
     '/auth/logout', 
     extra: { AuthInterceptor.requiresAuthKey: false, },
      );
  }

  @override
  Future<RefreshResponseModel> refreshToken() async{
    final response = await _apiClient.post<Map<String, dynamic>>(
       '/auth/refresh-token', extra: { AuthInterceptor.requiresAuthKey: false, }, ); 
    return RefreshResponseModel.fromJson( response.data!, );
  }

  @override
  Future<AuthResponseModel> register(RegisterRequestModel request) async{
   final response = await _apiClient.post<Map<String, dynamic>>(
     '/auth/register', data: request.toJson(), 
   extra: { AuthInterceptor.requiresAuthKey: false, }, ); 
   return AuthResponseModel.fromJson( response.data!, );
  }
}
