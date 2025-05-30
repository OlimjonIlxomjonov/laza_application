import 'package:laza_applicaiton/features/home/domain/entity/all_products.dart';

abstract class ProductsState {
  ProductsState();
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<AllProducts> products;

  ProductsLoaded(this.products);
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);
}
