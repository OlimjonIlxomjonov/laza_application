import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/auth_event.dart';
import 'package:laza_applicaiton/features/auth/presentation/bloc/sign_in/sign_in_state.dart';

class SignInBloc extends Bloc<AuthEvent, SignInState> {
  final SignInUseCase useCase;

  SignInBloc(this.useCase) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(SignInLoading());
      try {
        final signIn = await useCase.call(
          email: event.email,
          password: event.password,
        );
        emit(SignInLoaded(signIn));
      } catch (e) {
        emit(SignInError(e.toString()));
      }
    });
  }
}
