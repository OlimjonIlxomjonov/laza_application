import 'package:laza_applicaiton/features/home/domain/entity/all_products.dart';

abstract class ByCategoryState {
  ByCategoryState();
}

class ByCategoryInitial extends ByCategoryState {}

class ByCategoryLoading extends ByCategoryState {}

class ByCategoryLoaded extends ByCategoryState {
  final List<AllProducts> result;

  ByCategoryLoaded(this.result);
}

class ByCategoryError extends ByCategoryState {
  final String message;

  ByCategoryError(this.message);
}
