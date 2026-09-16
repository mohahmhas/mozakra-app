// ignore: file_names
import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  final String? code;
  final dynamic data;
  final DioExceptionType? type;
  const NetworkException({required this.message, this.statusCode, this.code, this.data, this.type});

  factory NetworkException.fromDioException(DioException exception) {
    final response = exception.response;

    if (response != null) {
      return NetworkException(
        message: _messageFromResponse(response),
        statusCode: response.statusCode,
        code: response.data?['code'] as String?,
        data: response.data,
        type: exception.type,
      );
    }
    // Handle DioException without a response (e.g., connection timeout, no internet)
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkException(message: 'Connection timeout');

      case DioExceptionType.sendTimeout:
        return const NetworkException(message: 'Request timeout');

      case DioExceptionType.receiveTimeout:
        return const NetworkException(message: 'Response timeout');

      case DioExceptionType.connectionError:
        return const NetworkException(message: 'No internet connection');

      case DioExceptionType.badCertificate:
        return const NetworkException(message: 'Invalid server certificate');

      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request cancelled');

      case DioExceptionType.badResponse:
        return NetworkException(
          message: 'Server returned an invalid response',
          statusCode: response?.statusCode,
          data: response?.data,
        );

      case DioExceptionType.unknown:
        return NetworkException(
          message: exception.message ?? 'Unknown network error',
        );

      default:
        return const NetworkException(message: 'Something went wrong');
    }
  }

  static String _messageFromResponse(Response<dynamic> response) {
    final data = response.data;

    if (data is Map<String, dynamic>) {
      final message = data['message'];

      if (message is String && message.isNotEmpty) {
        return message;
      }
    }

    switch (response.statusCode) {
      case 400:
        return 'Bad request';

      case 401:
        return 'Unauthorized';

      case 403:
        return 'Forbidden';

      case 404:
        return 'Resource not found';

      case 409:
        return 'Conflict';

      case 422:
        return 'Validation error';

      case 500:
        return 'Internal server error';

      default:
        return 'Something went wrong';
    }
  }

  @override
  String toString() {
    return 'NetworkException('
        'message: $message, '
        'statusCode: $statusCode'
        ')';
  }
}
