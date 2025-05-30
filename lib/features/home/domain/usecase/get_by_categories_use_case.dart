import 'package:laza_applicaiton/features/home/domain/repository/product_repository.dart';

import '../entity/all_products.dart';

class GetByCategoriesUseCase {
  final ProductRepository repository;

  GetByCategoriesUseCase(this.repository);

  Future<List<AllProducts>> call({required String category}) {
    return repository.getByCategories(category: category);
  }
}
