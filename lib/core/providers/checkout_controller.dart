import 'package:flutter/material.dart';

import '../../models/product.dart';

/// Creates a CheckOutController
class CheckOutController with ChangeNotifier {
  /// Creates a CheckOutController
  CheckOutController();

  List<Product> _cartContents = [];
  bool _isProductAdded = false;

  /// the products in the cart
  List<Product> get cartContents => _cartContents;

  
  /// if product is already in the cart
  bool get isProductAdded => _isProductAdded;

  /// set all items in products from [AllProductsController]
  void setCart({required List<Product> cart}) {
    _cartContents = cart;
    debugPrint('Cart set');
  }

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

  void removeProduct(int id) {
    _cartContents.removeWhere((product) => product.productId == id);
    debugPrint('Removed: ' + _cartContents.toString());
    notifyListeners();
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
