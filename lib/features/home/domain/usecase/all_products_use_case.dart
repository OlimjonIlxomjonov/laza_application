import 'package:laza_applicaiton/features/home/domain/entity/all_products.dart';

import '../repository/product_repository.dart';

class AllProductsUseCase {
  final ProductRepository repository;

  AllProductsUseCase(this.repository);

  Future<List<AllProducts>> call() {
    return repository.fetchAllProducts();
  }
}
