import 'package:dio/dio.dart';

import '../../constants/app_constants.dart';
import '../../storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required SecureStorageService secureStorage,
  }) : _secureStorage = secureStorage;

  final SecureStorageService _secureStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requiresAuth =
        options.extra['requiresAuth'] as bool? ?? true;

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
  }
}