import 'package:laza_applicaiton/features/home/domain/entity/all_products.dart';
import 'package:laza_applicaiton/features/home/domain/repository/product_repository.dart';

class GetSingleProductUseCase {
  final ProductRepository repository;

  GetSingleProductUseCase(this.repository);

  Future<AllProducts> call({required int id}) {
    return repository.getSingleProduct(id: id);
  }
}
