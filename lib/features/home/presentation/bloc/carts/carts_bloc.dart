import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/all_carts_use_case.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/carts/carts_state.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';

class CartsBloc extends Bloc<HomeEvent, CartsState> {
  final AllCartsUseCase useCase;

  CartsBloc(this.useCase) : super(CartsInitial()) {
    on<FetchCartsEvent>(onCarts);
  }

  Future<void> onCarts(event, emit) async {
    emit(CartsLoading());
    try {
      final result = await useCase.call();
      emit(CartsLoaded(result));
    } catch (e) {
      emit(CartsError(e.toString()));
    }
  }
}
