import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/create_new_password_use_case.dart';

import '../auth_event.dart';
import 'create_new_password_state.dart';

class CreateNewPasswordBloc extends Bloc<AuthEvent, CreateNewPasswordState> {
  final CreateNewPasswordUseCase useCase;

  CreateNewPasswordBloc(this.useCase) : super(CreateNewPasswordInitial()) {
    on<CreateNewPasswordEvent>((event, emit) async {
      emit(CreateNewPasswordLoading());
      try {
        await useCase.call(password: event.password, token: event.token);
        emit(CreateNewPasswordLoaded());
      } catch (e) {
        emit(CreateNewPasswordError(e.toString()));
      }
    });
  }
}
