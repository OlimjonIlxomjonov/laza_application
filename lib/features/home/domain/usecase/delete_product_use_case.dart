import 'package:laza_applicaiton/features/home/domain/repository/product_repository.dart';

class DeleteProductUseCase {
  final ProductRepository repository;

  DeleteProductUseCase(this.repository);

  Future<bool> call({required int id}) {
    return repository.deleteProduct(id: id);
  }
}
