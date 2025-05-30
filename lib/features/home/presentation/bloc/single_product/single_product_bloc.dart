import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/get_single_product_use_case.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/single_product/singel_product_state.dart';

class SingleProductBloc extends Bloc<HomeEvent, SingleProductState> {
  final GetSingleProductUseCase useCase;

  SingleProductBloc(this.useCase) : super(SingleProductInitial()) {
    on<FetchSingleProductEvent>((event, emit) async {
      emit(SingleProductLoading());
      try {
        final result = await useCase.call(id: event.id);
        emit(SingleProductLoaded(result));
      } catch (e) {
        emit(SingleProductError(e.toString()));
      }
    });
  }
}
