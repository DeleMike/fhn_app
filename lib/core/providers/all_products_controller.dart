import 'package:flutter/material.dart';

import '../../models/product.dart';

class AllProductsController with ChangeNotifier {
  int _productInCart = 0;
  bool _isProductAdded = false;
  final List<Product> _products = [];

  int get producInCart => _productInCart;
  bool get isProductAdded => _isProductAdded;

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
}
