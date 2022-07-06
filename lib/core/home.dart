import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

import '../data/product_data.dart';
import '../configs/constants.dart';
import '../configs/routes.dart';

import '../core/providers/all_products_controller.dart';

/// Display all products
class HomeScreen extends StatelessWidget {
  /// Display all products
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCanvasColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Products Wall',
          style: Theme.of(context).textTheme.headline5,
        ),
        foregroundColor: kPrimaryTextColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: kPaddingM),
            child: IconButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.checkout),
              icon: Badge(
                badgeContent: Text(context.watch<AllProductsController>().producInCart.toString(),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(color: kWhite)),
                child: const Icon(Icons.shopping_cart_checkout_outlined),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: kPaddingM, left: kPaddingS + 2, right: kPaddingM + 2),
            child: const _GridContainer(),
          ),
        ),
      ),
    );
  }
}

class _GridContainer extends StatefulWidget {
  const _GridContainer({Key? key}) : super(key: key);

  @override
  State<_GridContainer> createState() => _GridContainerState();
}

class _GridContainerState extends State<_GridContainer> {
  bool isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (ctx, index) {
        return InkWell(
            onTap: (() {
              debugPrint('Position $index clicked');
            }),
            child: Card(
              key: ValueKey(products[index].productId),
              elevation: kCardElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kSmallRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Image.asset(products[index].imageUrl)),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        products[index].name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        'NGN ' '${products[index].price.toString()}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                  Flexible(
                      child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<AllProductsController>().addToCart(products[index]);

                      debugPrint('Product ID: ${products[index].productId}');
                      debugPrint('Product Name: ${products[index].name}');
                      debugPrint('Product Price: ${products[index].price}');
                      debugPrint('Product Desc: ${products[index].description}');

                      if (context.read<AllProductsController>().isProductAdded) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text('Already in cart')));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text('Added to cart')));
                      }
                    },
                    icon: const Icon(Icons.add_shopping_cart_outlined),
                    label: const Text('Add to cart'),
                  )),
                ],
              ),
            ));
      },
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
