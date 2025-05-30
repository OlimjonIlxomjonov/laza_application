import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/product_categories_use_case.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';

import 'categories_state.dart';

class CategoriesBloc extends Bloc<HomeEvent, CategoriesState> {
  final ProductCategoriesUseCase useCase;

  CategoriesBloc(this.useCase) : super(CategoriesInitial()) {
    on<FetchAllCategoriesEvent>((event, emit) async {
      emit(CategoriesLoading());
      try {
        final result = await useCase.call();
        emit(CategoriesLoaded(result));
      } catch (e) {
        emit(CategoriesError(e.toString()));
      }
    });
  }
}
