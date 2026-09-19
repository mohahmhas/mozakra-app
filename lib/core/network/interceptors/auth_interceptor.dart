import 'package:dio/dio.dart';

import '../../constants/app_constants.dart';
import '../../storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final SecureStorageService _secureStorage;

  static const String requiresAuthKey = 'requiresAuth';
  static const String skipRefreshKey = 'skipRefresh';
  static const String retryCountKey = 'retryCount';

  Future<String?>? _refreshingToken;

  AuthInterceptor({
    required Dio dio,
    required SecureStorageService secureStorage,
  }) : _secureStorage = secureStorage,
       _dio = dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final requiresAuth = options.extra[requiresAuthKey] as bool? ?? true;

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
    } catch (error, stackTrace) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: error,
          stackTrace: stackTrace,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    final requestOptions = err.requestOptions;
    final statusCode = response?.statusCode;
    final requiresAuth = requestOptions.extra[requiresAuthKey] as bool? ?? true;
    final skipRefresh = requestOptions.extra[skipRefreshKey] as bool? ?? false;
    final retryCount = requestOptions.extra[retryCountKey] as int? ?? 0;

    if (statusCode != 401 || !requiresAuth || skipRefresh || retryCount >= 1) {
      handler.next(err);
      return;
    }
    try {
      final newAccessToken = await _refreshAccessToken();
      if (newAccessToken == null || newAccessToken.isEmpty) {
        await _clearAccessToken();
        handler.next(err);
        return;
      }
      requestOptions.extra[retryCountKey] = retryCount + 1;
      requestOptions.headers[AppConstants.authorizationHeader] =
          '${AppConstants.bearerPrefix} $newAccessToken';
      final retryResponse = await _dio.fetch<dynamic>(requestOptions);
      handler.resolve(retryResponse);
    } catch (refreshError, refreshStackTrace) {
      await _clearAccessToken();
      handler.reject(
        DioException(
          requestOptions: requestOptions,
          error: refreshError,
          stackTrace: refreshStackTrace,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  Future<String?> _refreshAccessToken() {
    final currentRefresh = _refreshingToken;
    if (currentRefresh != null) {
      return currentRefresh;
    }
    final refreshFuture = _performRefresh();
    _refreshingToken = refreshFuture;
    refreshFuture.whenComplete(() {
      _refreshingToken = null;
    });
    return refreshFuture;
  }


  Future<String?> _performRefresh() async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/refresh-token',
        options: Options(extra: {requiresAuthKey: false, skipRefreshKey: true}),
      );
      final data = response.data?['data'];
      if (data is! Map<String, dynamic>) {
        return null;
      }
      final accessToken = data['accessToken'];
      if (accessToken is! String || accessToken.isEmpty) {
        return null;
      }
      await _secureStorage.saveAccessToken(accessToken);
      return accessToken;
    } on DioException {
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<void> _clearAccessToken() async {
    await _secureStorage.deleteAccessToken();
  }
}
