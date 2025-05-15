import 'package:laza_applicaiton/features/auth/domain/entities/reset_password.dart';

abstract class AuthEvent {
  AuthEvent();
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpEvent(this.email, this.password);
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}

class ConfirmationCodeEvent extends AuthEvent {
  final int userId;
  final int code;

  ConfirmationCodeEvent(this.userId, this.code);
}

class ResetPasswordEvent extends AuthEvent {
  final String message;

  ResetPasswordEvent(this.message);
}

class CreateNewPasswordEvent extends AuthEvent {
  final String password;
  final String token;

  CreateNewPasswordEvent(this.password, this.token);
}
