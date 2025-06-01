import 'package:laza_applicaiton/features/home/domain/entity/all_carts.dart';
import 'package:laza_applicaiton/features/home/domain/repository/product_repository.dart';

class AllCartsUseCase {
  final ProductRepository repository;

  AllCartsUseCase(this.repository);

  Future<AllCarts> call() {
    return repository.getAllCarts();
  }
}
