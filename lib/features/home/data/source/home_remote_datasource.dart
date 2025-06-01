import 'package:laza_applicaiton/features/home/data/model/all_carts_model.dart';
import 'package:laza_applicaiton/features/home/data/model/all_products_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<AllProductsModel>> fetchAllProducts();

  Future<List<String>> fetchCategories();

  Future<List<AllProductsModel>> getByCategories({required String category});

  Future<AllProductsModel> getSingleProduct({required int id});

  Future<AllCartsModel> fetchAllCarts();

  Future<bool> deleteProduct({required int id});
}
