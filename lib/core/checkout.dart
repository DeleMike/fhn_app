import 'package:flutter/material.dart';

import '../configs/constants.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCanvasColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headline5,
        ),
        foregroundColor: kPrimaryTextColor,
      ),
      body: const Center(child: Text('Check out'),),
    );
  }
}
