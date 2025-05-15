import 'package:laza_applicaiton/features/auth/domain/entities/auth_token.dart';

abstract class SignInState {
  SignInState();
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInLoaded extends SignInState {
  final AuthToken tokens;

  SignInLoaded(this.tokens);
}

class SignInError extends SignInState {
  final String message;

  SignInError(this.message);
}
