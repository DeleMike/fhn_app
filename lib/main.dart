import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'configs/app_theme.dart';
import 'configs/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia',
      theme: AppTheme(context).lightTheme,
      initialRoute: '/',
      routes: Routes().generateRoutes(context),
      debugShowCheckedModeBanner: false,
    );
  }
}
