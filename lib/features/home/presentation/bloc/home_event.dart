abstract class HomeEvent {
  HomeEvent();
}

class FetchAllProductsEvent extends HomeEvent {}

class FetchAllCategoriesEvent extends HomeEvent {}

class ProductsByCategoryEvent extends HomeEvent {
  final String category;

  ProductsByCategoryEvent(this.category);
}

class FetchSingleProductEvent extends HomeEvent {
  final int id;

  FetchSingleProductEvent(this.id);
}

class FetchCartsEvent extends HomeEvent {}

class DeleteProductEvent extends HomeEvent {
  final int id;

  DeleteProductEvent(this.id);
}
