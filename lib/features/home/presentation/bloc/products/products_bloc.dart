import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/all_products_use_case.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/products/products_state.dart';

class ProductsBloc extends Bloc<HomeEvent, ProductsState> {
  final AllProductsUseCase useCase;

  ProductsBloc(this.useCase) : super(ProductsInitial()) {
    on<FetchAllProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      try {
        final result = await useCase.call();
        emit(ProductsLoaded(result));
      } catch (e) {
        emit(ProductsError(e.toString()));
      }
    });
  }
}
