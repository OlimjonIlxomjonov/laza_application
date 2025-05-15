import 'package:laza_applicaiton/features/auth/domain/entities/auth_token.dart';

class AuthTokensModel extends AuthToken {
  AuthTokensModel({required super.refreshToken, required super.accessToken});

  factory AuthTokensModel.fromJson(Map<String, dynamic> json) {
    return AuthTokensModel(
      refreshToken: json['refresh'] as String,
      accessToken: json['access'] as String,
    );
  }
}
