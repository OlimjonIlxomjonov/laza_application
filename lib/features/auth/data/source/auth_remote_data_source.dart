import 'package:laza_applicaiton/features/auth/data/models/auth_tokens_model.dart';
import 'package:laza_applicaiton/features/auth/data/models/register_response_model.dart';
import 'package:laza_applicaiton/features/auth/data/models/reset_password_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponseModel> signUp({
    required String email,
    required String password,
  });

  Future<AuthTokensModel> signIn({
    required String email,
    required String password,
  });

  Future<AuthTokensModel> confirmationCode({
    required int userId,
    required int code,
  });

  Future<ResetPasswordModel> resetPassword({required String message});

  Future<void> createNewPassword({
    required String password,
    required String token,
  });
}
