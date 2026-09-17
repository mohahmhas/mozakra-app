import 'package:dio/dio.dart';

import '../../constants/app_constants.dart';
import '../../storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _secureStorage;
  static const String requiresAuthKey = 'requiresAuth';
  AuthInterceptor({
    required SecureStorageService secureStorage,
  }) : _secureStorage = secureStorage;

  
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
   try{
     final requiresAuth =
        options.extra[requiresAuthKey] as bool? ?? true;

    if (!requiresAuth) {
      handler.next(options);
      return;
    }

    final accessToken = await _secureStorage.getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers[AppConstants.authorizationHeader] =
          '${AppConstants.bearerPrefix} $accessToken';
    }

    handler.next(options);
   }catch(e){
    handler.reject(DioException(requestOptions: options, error: e,
    stackTrace: StackTrace.current,
    type:DioExceptionType.unknown
    ));
   }
  }
}