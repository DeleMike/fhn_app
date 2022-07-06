import 'package:flutter/material.dart';

import '../core/home.dart';
import '../core/checkout.dart';

/// Defines established routes in the application
class Routes {
  static const home = '/';
  static const checkout = '/checkout';

  /// Route generator. This will list all the available routes in the application
  Map<String, Widget Function(BuildContext)> generateRoutes(BuildContext context) {
    return {
      home: (ctx) => const HomeScreen(),
      checkout: (ctx) => const Checkout(),
    };
  }
}
