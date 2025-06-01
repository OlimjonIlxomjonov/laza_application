import 'package:laza_applicaiton/features/home/data/source/home_remote_datasource.dart';
import 'package:laza_applicaiton/features/home/domain/entity/all_carts.dart';
import 'package:laza_applicaiton/features/home/domain/entity/all_products.dart';
import 'package:laza_applicaiton/features/home/domain/repository/product_repository.dart';

class HomeRepositoryImpl implements ProductRepository {
  final HomeRemoteDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<List<AllProducts>> fetchAllProducts() {
    return dataSource.fetchAllProducts();
  }

  @override
  Future<List<String>> fetchCategories() {
    return dataSource.fetchCategories();
  }

  @override
  Future<List<AllProducts>> getByCategories({required String category}) {
    return dataSource.getByCategories(category: category);
  }

  @override
  Future<AllProducts> getSingleProduct({required int id}) {
    return dataSource.getSingleProduct(id: id);
  }

  @override
  Future<AllCarts> getAllCarts() {
    return dataSource.fetchAllCarts();
  }

  @override
  Future<bool> deleteProduct({required int id}) {
    return dataSource.deleteProduct(id: id);
  }
}
