import 'package:laza_applicaiton/features/home/domain/entity/all_products.dart';

class AllProductsModel extends AllProducts {
  AllProductsModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    return AllProductsModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}

class RatingModel extends Rating {
  RatingModel({required super.rate, required super.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }
}
