import 'package:laza_applicaiton/features/auth/domain/entities/reset_password.dart';
import 'package:laza_applicaiton/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<ResetPassword> call({required String message}) {
    return repository.resetPassword(message: message);
  }
}
