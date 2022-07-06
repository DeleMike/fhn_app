import 'package:flutter/material.dart';

import '../../models/product.dart';

/// Creates a CheckOutController
class CheckOutController with ChangeNotifier {
  /// Creates a CheckOutController
  CheckOutController();

  final List<Product> _cartContents = [];
  bool _isProductAdded = false;
  double _totalPrice = 0.0;

  /// the products in the cart
  List<Product> get cartContents => _cartContents;

  /// if product is already in the cart
  bool get isProductAdded => _isProductAdded;

  /// total price user will pay
  double get totalPrice => _totalPrice;

  /// add product item to cart
  void addToCart(Product product) {
    bool isAlreadyAdded = _cartContents.any((prod) => prod.productId == product.productId);
    if (!isAlreadyAdded) {
      _cartContents.add(product);
      _isProductAdded = false;
    } else {
      _isProductAdded = true;
    }
    notifyListeners();
  }

  /// Remove item from cart
  void removeProduct(int id) {
    // reset quantity to default
    var product = _cartContents.firstWhere((product) => product.productId == id);
    product.quantity = 1;

    // then remove from list
    _cartContents.removeWhere((product) => product.productId == id);
    _calculateTotalPrice();
    notifyListeners();
  }

  void updateProductQuantity(int id, int amount) {
    var product = _cartContents.firstWhere((product) => product.productId == id);
    product.quantity = amount;

    debugPrint('Product ID: ${product.productId}');
    debugPrint('Product Name: ${product.name}');
    debugPrint('Product Price: ${product.price}');
    debugPrint('Product Desc: ${product.description}');
    debugPrint('Product Quantity: ${product.quantity}');

    _calculateTotalPrice();

    notifyListeners();
  }

  /// Calculate total price of cart contents
  void getPrice() {
    _calculateTotalPrice();
    notifyListeners();
  }

  // calculate price
  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (var product in _cartContents) {
      _totalPrice += product.quantity * product.price;
    }
  }

  /// Clear / reset all member variables states.
  ///
  /// * Because of an [issue](https://github.com/rrousselGit/provider/issues/444) with Provider
  ///
  void clearStates() {
    _isProductAdded = false;
    _cartContents.clear();
  }
}
