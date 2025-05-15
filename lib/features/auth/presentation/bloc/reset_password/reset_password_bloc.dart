import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/auth_event.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<AuthEvent, ResetPasswordState> {
  final ResetPasswordUseCase useCase;

  ResetPasswordBloc(this.useCase) : super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        final result = await useCase.call(message: event.message);
        emit(ResetPasswordLoaded(result));
      } catch (e) {
        emit(ResetPasswordError(e.toString()));
      }
    });
  }
}
