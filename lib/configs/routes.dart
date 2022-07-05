import 'package:flutter/material.dart';

import '../core/home.dart';

/// Defines established routes in the application
class Routes {
  static const home = '/';

  /// Route generator. This will list all the available routes in the application
  Map<String, Widget Function(BuildContext)> generateRoutes(BuildContext context) {
    return {
      home: (ctx) => HomeScreen(),
    };
  }
}
