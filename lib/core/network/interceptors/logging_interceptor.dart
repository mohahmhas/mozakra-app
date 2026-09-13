import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    this.enabled = true,
  });

  final bool enabled;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (enabled) {
      debugPrint(
        '┌────────────────────── REQUEST ──────────────────────',
      );
      debugPrint('${options.method} ${options.uri}');
      debugPrint('Headers: ${_sanitizeHeaders(options.headers)}');

      if (options.data != null) {
        debugPrint('Body: ${options.data}');
      }

      debugPrint(
        '└──────────────────────────────────────────────────────',
      );
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (enabled) {
      debugPrint(
        '┌────────────────────── RESPONSE ─────────────────────',
      );
      debugPrint(
        '${response.statusCode} ${response.requestOptions.uri}',
      );
      debugPrint('Body: ${response.data}');
      debugPrint(
        '└──────────────────────────────────────────────────────',
      );
    }

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (enabled) {
      debugPrint(
        '┌──────────────────────── ERROR ──────────────────────',
      );
      debugPrint(
        '${err.response?.statusCode} '
        '${err.requestOptions.uri}',
      );
      debugPrint('Message: ${err.message}');
      debugPrint(
        '└──────────────────────────────────────────────────────',
      );
    }

    handler.next(err);
  }

  Map<String, dynamic> _sanitizeHeaders(
    Map<String, dynamic> headers,
  ) {
    final sanitized = Map<String, dynamic>.from(headers);

    sanitized.remove('Authorization');
    sanitized.remove('authorization');
    sanitized.remove('Cookie');
    sanitized.remove('cookie');
    sanitized.remove('Set-Cookie');
    sanitized.remove('set-cookie');

    return sanitized;
  }
}