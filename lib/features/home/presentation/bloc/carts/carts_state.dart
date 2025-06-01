import 'package:laza_applicaiton/features/home/domain/entity/all_carts.dart';

abstract class CartsState {
  CartsState();
}

class CartsInitial extends CartsState {}

class CartsLoading extends CartsState {}

class CartsLoaded extends CartsState {
  final AllCarts carts;

  CartsLoaded(this.carts);
}

class CartsError extends CartsState {
  final String message;

  CartsError(this.message);
}
