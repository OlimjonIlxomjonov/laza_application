import 'package:laza_applicaiton/features/auth/domain/entities/register_response.dart';

abstract class SignUpState {
  SignUpState();
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {
  final RegisterResponseUser user;

  SignUpLoaded(this.user);
}

class SignUpError extends SignUpState {
  final String message;

  SignUpError(this.message);
}
