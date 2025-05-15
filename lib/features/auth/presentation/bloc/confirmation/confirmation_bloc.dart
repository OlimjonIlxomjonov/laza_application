import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/confirmation_use_case.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/auth_event.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/confirmation/confirmation_state.dart';

class ConfirmationBloc extends Bloc<AuthEvent, ConfirmationState> {
  final ConfirmationUseCase useCase;

  ConfirmationBloc(this.useCase) : super(ConfirmationInitial()) {
    on<ConfirmationCodeEvent>((event, emit) async {
      emit(ConfirmationLoading());
      try {
        final confirmationCode = await useCase.call(
          userId: event.userId,
          code: event.code,
        );
        emit(ConfirmationLoaded(confirmationCode));
      } catch (e) {
        emit(ConfirmationError(e.toString()));
      }
    });
  }
}
