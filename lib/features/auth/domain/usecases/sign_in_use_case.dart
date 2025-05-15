import 'package:laza_applicaiton/features/auth/domain/entities/auth_token.dart';
import 'package:laza_applicaiton/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<AuthToken> call({required String email, required String password}) {
    return repository.singIn(email: email, password: password);
  }
}
