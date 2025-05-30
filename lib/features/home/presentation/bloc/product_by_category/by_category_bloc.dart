import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/get_by_categories_use_case.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/product_by_category/by_category_state.dart';

class ByCategoryBloc extends Bloc<HomeEvent, ByCategoryState> {
  final GetByCategoriesUseCase useCase;

  ByCategoryBloc(this.useCase) : super(ByCategoryInitial()) {
    on<ProductsByCategoryEvent>((event, emit) async {
      emit(ByCategoryLoading());
      try {
        final result = await useCase.call(category: event.category);
        emit(ByCategoryLoaded(result));
      } catch (e) {
        emit(ByCategoryError(e.toString()));
      }
    });
  }
}
