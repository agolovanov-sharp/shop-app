import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Theme.of(context).colorScheme.primary,
      minimumSize: const Size(88, 44),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      backgroundColor: Colors.transparent,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleMedium
                              ?.color),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                    style: flatButtonStyle,
                    onPressed: () {},
                    child: Text('ORDER NOW'),
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Theme.of(context).colorScheme.primary,
                  //     padding: EdgeInsets.all(10),
                  //   ),
                  //   child: Text("ORDER NOW"),
                  //   onPressed: () {
                  //     //Code Here
                  //   },
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
