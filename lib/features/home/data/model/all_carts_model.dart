import 'package:laza_applicaiton/features/home/domain/entity/all_carts.dart';

class AllCartsModel extends AllCarts {
  AllCartsModel({
    required super.id,
    required super.userId,
    required super.date,
    required super.products,
  });

  factory AllCartsModel.fromJson(Map<String, dynamic> json) {
    return AllCartsModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products:
          (json['products'] as List)
              .map((item) => ProductItemModel.fromJson(item))
              .toList(),
    );
  }
}

class ProductItemModel extends ProductItem {
  ProductItemModel({required super.productId, required super.quantity});

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }
}
