import 'user_model.dart';

class AuthResponseModel {
  const AuthResponseModel({
    required this.user,
    required this.accessToken,
  });

  final UserModel user;
  final String accessToken;

  factory AuthResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final data = json['data'] as Map<String, dynamic>;

    return AuthResponseModel(
      user: UserModel.fromJson(
        data['user'] as Map<String, dynamic>,
      ),
      accessToken: data['accessToken'] as String,
    );
  }
}

class RefreshResponseModel {
  const RefreshResponseModel({
    required this.accessToken,
  });

  final String accessToken;

  factory RefreshResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final data = json['data'] as Map<String, dynamic>;

    return RefreshResponseModel(
      accessToken: data['accessToken'] as String,
    );
  }
}
