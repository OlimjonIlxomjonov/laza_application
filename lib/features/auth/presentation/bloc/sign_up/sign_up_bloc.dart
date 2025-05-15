import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/auth_event.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<AuthEvent, SignUpState> {
  final SignUpUseCase useCase;

  SignUpBloc(this.useCase) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignUpLoading());
      try {
        final user = await useCase.call(
          email: event.email,
          password: event.password,
        );
        emit(SignUpLoaded(user));
      } catch (e) {
        emit(SignUpError(e.toString()));
      }
    });
  }
}
