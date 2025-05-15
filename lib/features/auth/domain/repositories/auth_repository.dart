import 'package:laza_applicaiton/features/auth/domain/entities/auth_token.dart';
import 'package:laza_applicaiton/features/auth/domain/entities/register_response.dart';
import 'package:laza_applicaiton/features/auth/domain/entities/reset_password.dart';

abstract class AuthRepository {
  /// SIGN UP
  Future<RegisterResponseUser> signUp({
    required String email,
    required String password,
  });

  /// SIGN IN
  Future<AuthToken> singIn({required String email, required String password});

  /// CONFIRMATION CODE
  Future<AuthToken> confirmationCode({required int userId, required int code});

  /// RESET PASSWORD
  Future<ResetPassword> resetPassword({required String message});

  /// NEW PASSWORD
  Future<void> createNewPassword({
    required String password,
    required String token,
  });
}
