import 'package:laza_applicaiton/features/auth/domain/entities/auth_token.dart';
import 'package:laza_applicaiton/features/auth/domain/repositories/auth_repository.dart';

class ConfirmationUseCase {
  final AuthRepository repository;

  ConfirmationUseCase(this.repository);

  Future<AuthToken> call({required int userId, required int code}) async {
    return await repository.confirmationCode(userId: userId, code: code);
  }
}
