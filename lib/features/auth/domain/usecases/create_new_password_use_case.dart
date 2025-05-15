import 'package:laza_applicaiton/features/auth/domain/repositories/auth_repository.dart';

class CreateNewPasswordUseCase {
  final AuthRepository repository;

  CreateNewPasswordUseCase(this.repository);

  Future<void> call({required String password, required String token}) async {
    return await repository.createNewPassword(password: password, token: token);
  }
}
