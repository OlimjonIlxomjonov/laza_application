import 'package:laza_applicaiton/features/home/domain/entity/all_products.dart';

abstract class ProductRepository {
  Future<List<AllProducts>> fetchAllProducts();

  Future<List<String>> fetchCategories();

  Future<List<AllProducts>> getByCategories({required String category});

  Future<AllProducts> getSingleProduct({required int id});
}
