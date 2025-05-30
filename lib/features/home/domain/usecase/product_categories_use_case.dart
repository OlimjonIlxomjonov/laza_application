import 'package:laza_applicaiton/features/home/domain/repository/product_repository.dart';

class ProductCategoriesUseCase {
  final ProductRepository repository;

  ProductCategoriesUseCase(this.repository);

  Future<List<String>> call() {
    return repository.fetchCategories();
  }
}
