import 'package:laza_applicaiton/features/auth/domain/entities/reset_password.dart';

abstract class ResetPasswordState {
  ResetPasswordState();
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordLoaded extends ResetPasswordState {
  final ResetPassword resetPassword;

  ResetPasswordLoaded(this.resetPassword);
}

class ResetPasswordError extends ResetPasswordState {
  final String message;

  ResetPasswordError(this.message);
}
