import 'package:flutter/material.dart';

import '../../models/product.dart';

/// All Products Page Controller
class AllProductsController with ChangeNotifier {

  int _productInCart = 0;
  bool _isProductAdded = false;
  final List<Product> _products = [];

  /// The number of product in cart
  int get producInCart => _productInCart;

  /// if product is already in the cart
  bool get isProductAdded => _isProductAdded;

  /// add product item to cart
  void addToCart(Product product) {
    bool isAlreadyAdded = _products.any((prod) => prod.productId == product.productId);
    if (!isAlreadyAdded) {
      _products.add(product);
      _productInCart = _products.length;
      _isProductAdded = false;
    } else {
      _isProductAdded = true;
    }
    notifyListeners();
  }

  /// Clear / reset all member variables states.
  ///
  /// * Because of an [issue](https://github.com/rrousselGit/provider/issues/444) with Provider
  ///
  void clearStates() {
    _productInCart = 0;
    _isProductAdded = false;
    _products.clear();
  }
}
