abstract class DeleteState {
  DeleteState();
}

class DeleteInitial extends DeleteState {}

class DeleteLoading extends DeleteState {}

class DeleteLoaded extends DeleteState {}

class DeleteError extends DeleteState {
  final String message;

  DeleteError(this.message);
}
