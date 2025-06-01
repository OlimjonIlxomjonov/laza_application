import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_applicaiton/features/home/domain/usecase/delete_product_use_case.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/delete_product/delete_state.dart';
import 'package:laza_applicaiton/features/home/presentation/bloc/home_event.dart';

class DeleteBloc extends Bloc<HomeEvent, DeleteState> {
  final DeleteProductUseCase useCase;

  DeleteBloc(this.useCase) : super(DeleteInitial()) {
    on<DeleteProductEvent>((event, emit) async {
      emit(DeleteLoading());
      try {
        await useCase.call(id: event.id);
        emit(DeleteLoaded());
      } catch (e) {
        emit(DeleteError(e.toString()));
      }
    });
  }
}
