import 'package:fhn_shop/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'configs/app_theme.dart';
import 'configs/routes.dart';

import 'core/providers/checkout_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CheckOutController>(
          create: (ctx) => CheckOutController(),
        ),
      ],
      child: MaterialApp(
        title: kAppName,
        theme: AppTheme(context).lightTheme,
        initialRoute: '/',
        routes: Routes().generateRoutes(context),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
