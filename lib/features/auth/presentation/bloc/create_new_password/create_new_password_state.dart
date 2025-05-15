abstract class CreateNewPasswordState {
  CreateNewPasswordState();
}

class CreateNewPasswordInitial extends CreateNewPasswordState {}

class CreateNewPasswordLoading extends CreateNewPasswordState {}

class CreateNewPasswordLoaded extends CreateNewPasswordState {}

class CreateNewPasswordError extends CreateNewPasswordState {
  final String message;

  CreateNewPasswordError(this.message);
}
