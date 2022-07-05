/// Model for a single Product
///
class Product {
  /// product's unique identifier.
  final int productId;

  /// product's name
  final String name;

  /// product's description
  final String description;

  ///product's image
  final String imageUrl;

  /// product's price
  final double price;

  /// product's cart state
  final bool isAdded;

  /// Model for a single Product
  ///
  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isAdded,
  });
}
