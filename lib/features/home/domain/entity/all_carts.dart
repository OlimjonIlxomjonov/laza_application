class AllCarts {
  final int id;
  final int userId;
  final DateTime date;
  final List<ProductItem> products;

  AllCarts({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });
}

class ProductItem {
  final int productId;
  final int quantity;

  ProductItem({required this.productId, required this.quantity});
}
