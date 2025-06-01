import 'dart:convert';
import 'dart:io';
import 'package:laza_applicaiton/core/common/constants/api_urls.dart';
import 'package:laza_applicaiton/core/netwrok/http_client.dart';
import 'package:laza_applicaiton/core/utils/logger/logger.dart';
import 'package:laza_applicaiton/features/home/data/model/all_carts_model.dart';
import 'package:laza_applicaiton/features/home/data/model/all_products_model.dart';
import 'package:laza_applicaiton/features/home/data/source/home_remote_datasource.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final MyHttpClient myHttpClient = MyHttpClient();

  @override
  Future<List<AllProductsModel>> fetchAllProducts() async {
    // ALL PRODUCTS
    try {
      final response = await myHttpClient.get(ApiUrls.products);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully fetched all products! ${response.body}');

        final List<dynamic> jsonList = jsonDecode(response.body);

        return jsonList
            .map((jsonItem) => AllProductsModel.fromJson(jsonItem))
            .toList();
      } else {
        throw HttpException('Failed to fetch products');
      }
    } catch (e) {
      logger.e('Error fetching products: $e');
      rethrow;
    }
  }

  // ALL CATEGORIES
  @override
  Future<List<String>> fetchCategories() async {
    try {
      final response = await myHttpClient.get(ApiUrls.productsCategories);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully fetched all categories! ${response.body}');
        final List<dynamic> decoded = jsonDecode(response.body);
        return List<String>.from(decoded);
      } else {
        logger.w('Error occurred while getting a categories ${response.body}');
        throw HttpException('Failed to fetch categories');
      }
    } catch (e) {
      logger.e('Error fetching products $e');
      rethrow;
    }
  }

  @override
  Future<List<AllProductsModel>> getByCategories({
    required String category,
  }) async {
    try {
      final response = await myHttpClient.get("${ApiUrls.categories}$category");
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully fetched products by category! ${response.body}');
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList
            .map((jsonItem) => AllProductsModel.fromJson(jsonItem))
            .toList();
      } else {
        throw Exception('Error occurred while getting a products by category');
      }
    } catch (e) {
      logger.e('cannot get a product by category! $e');
      rethrow;
    }
  }

  @override
  Future<AllProductsModel> getSingleProduct({required int id}) async {
    try {
      final response = await myHttpClient.get("${ApiUrls.products}$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully done! ${response.body}');
        final Map<String, dynamic> jsonList = jsonDecode(response.body);
        return AllProductsModel.fromJson(jsonList);
      } else {
        logger.w('Warning! ');
        throw Exception(
          'Error occurred while getting a single product! ${response.body}',
        );
      }
    } catch (e) {
      logger.e('Error occurred while fetching a single product! $e}');
      rethrow;
    }
  }

  /// ALL CARTS
  @override
  Future<AllCartsModel> fetchAllCarts() async {
    try {
      final response = await myHttpClient.get(ApiUrls.allCarts);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('All Cats successfully fetched! ${response.body}');
        final decodedJson = jsonDecode(response.body);
        return AllCartsModel.fromJson(decodedJson);
      } else {
        throw Exception(
          'Failed to load carts. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      logger.e('Error fetching carts: $e');
      rethrow;
    }
  }

  @override
  Future<bool> deleteProduct({required int id}) async {
    try {
      final response = await myHttpClient.delete("${ApiUrls.products}$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully deleted! ${response.statusCode}');
        return true;
      } else {
        throw Exception('Failed to delete! ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error occurred while deleting! $e');
      rethrow;
    }
  }
}
