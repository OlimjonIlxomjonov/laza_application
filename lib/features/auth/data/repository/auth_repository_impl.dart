import 'package:laza_applicaiton/features/auth/data/source/auth_remote_data_source.dart';
import 'package:laza_applicaiton/features/auth/domain/entities/auth_token.dart';
import 'package:laza_applicaiton/features/auth/domain/entities/register_response.dart';
import 'package:laza_applicaiton/features/auth/domain/entities/reset_password.dart';
import 'package:laza_applicaiton/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<RegisterResponseUser> signUp({
    required String email,
    required String password,
  }) {
    return remoteDataSource.signUp(email: email, password: password);
  }

  @override
  Future<AuthToken> singIn({required String email, required String password}) {
    return remoteDataSource.signIn(email: email, password: password);
  }

  @override
  Future<AuthToken> confirmationCode({required int userId, required int code}) {
    return remoteDataSource.confirmationCode(userId: userId, code: code);
  }

  @override
  Future<ResetPassword> resetPassword({required String message}) {
    return remoteDataSource.resetPassword(message: message);
  }

  @override
  Future<void> createNewPassword({
    required String password,
    required String token,
  }) {
    return remoteDataSource.createNewPassword(password: password, token: token);
  }
}
