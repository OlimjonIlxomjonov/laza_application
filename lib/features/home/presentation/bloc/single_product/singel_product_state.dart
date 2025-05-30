import 'package:laza_applicaiton/features/home/domain/entity/all_products.dart';

abstract class SingleProductState {
  SingleProductState();
}

class SingleProductInitial extends SingleProductState {}

class SingleProductLoading extends SingleProductState {}

class SingleProductLoaded extends SingleProductState {
  final AllProducts singleProduct;

  SingleProductLoaded(this.singleProduct);
}

class SingleProductError extends SingleProductState {
  final String message;

  SingleProductError(this.message);
}
