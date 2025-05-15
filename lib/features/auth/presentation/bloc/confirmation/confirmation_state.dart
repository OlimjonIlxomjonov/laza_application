import 'package:laza_applicaiton/features/auth/domain/entities/auth_token.dart';

abstract class ConfirmationState {
  ConfirmationState();
}

class ConfirmationInitial extends ConfirmationState {}

class ConfirmationLoading extends ConfirmationState {}

class ConfirmationLoaded extends ConfirmationState {
  final AuthToken authToken;

  ConfirmationLoaded(this.authToken);
}

class ConfirmationError extends ConfirmationState {
  final String message;

  ConfirmationError(this.message);
}
