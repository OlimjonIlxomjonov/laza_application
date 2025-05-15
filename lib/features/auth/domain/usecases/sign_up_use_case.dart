import 'package:laza_applicaiton/features/auth/domain/entities/register_response.dart';
import 'package:laza_applicaiton/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<RegisterResponseUser> call({
    required String email,
    required String password,
  }) {
    return repository.signUp(email: email, password: password);
  }
}
