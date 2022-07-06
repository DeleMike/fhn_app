import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/configs/constants.dart';

import '/models/product.dart';
import 'providers/checkout_controller.dart';

/// Check out page to pay
class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.watch<CheckOutController>().cartContents;
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
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return _ListItem(
                  product: products[index],
                );
              },
              separatorBuilder: (_, __) {
                return const Divider(color: kPrimaryColor);
              },
              itemCount: products.length,
            ),
          ),
          Container(
            width: kScreenWidth(context),
            margin: const EdgeInsets.only(
              top: kPaddingM,
              left: kPaddingS + 2,
              right: kPaddingS + 2,
              bottom: kPaddingM,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: Text(
                  'PAY NGN PAY.00',
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: kWhite),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Represents a custom list tile
class _ListItem extends StatelessWidget {
  final Product product;
  const _ListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Flexible(
            child: Container(
              width: 150,
              height: 100,
              margin: const EdgeInsets.all(kPaddingS),
              //constraints: const BoxConstraints.expand(width: 150, height: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(kPaddingS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: kBlack,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kPaddingS),
                    child: Text(
                      'NGN ' '${product.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color.fromARGB(226, 54, 54, 54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: kPaddingM),
                    //padding: const EdgeInsets.all(kPaddingS),
                    decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(6)),
                    width: 70,
                    child: const QuantityDropdownButton()),
                TextButton.icon(
                  onPressed: () {
                    context.read<CheckOutController>().removeProduct(product.productId);
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text(
                    'Remove',
                    style: TextStyle(
                      fontSize: 14,
                      color: kBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Creates a drop down list option to select the product quantity to buy.
///
/// If user selects '1' then they want to buy one item.
class QuantityDropdownButton extends StatefulWidget {
  /// Creates a drop down list option to select the product quantity to buy.
  ///
  /// If user selects '1' then they want to buy one item.
  const QuantityDropdownButton({Key? key}) : super(key: key);

  @override
  State<QuantityDropdownButton> createState() => _QuantityDropdownButtonState();
}

class _QuantityDropdownButtonState extends State<QuantityDropdownButton> {
  String dropdownValue = '1';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70,
        child: Center(
          child: DropdownButton<String>(
            value: '1',
            icon: const Icon(Icons.expand_more),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['1', '2', '3', '4', '5'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ));
  }
}
