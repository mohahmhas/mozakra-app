abstract final class AppConstants {
  static const String appName = 'Muzakara';

  static const String accessTokenKey = 'access_token';

  static const String authorizationHeader = 'Authorization';

  static const String bearerPrefix = 'Bearer';

  static const String contentTypeJson = 'application/json';

  static const Duration connectTimeout = Duration(seconds: 15);

  static const Duration receiveTimeout = Duration(seconds: 20);

  static const Duration sendTimeout = Duration(seconds: 20);
}