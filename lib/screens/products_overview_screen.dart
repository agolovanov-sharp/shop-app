import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/providers/cart.dart';
import 'package:shop_app/models/providers/products_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('My shop'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == FilterOptions.Favorites) {
                productsProvider.showFavoritesOnly();
              } else {
                productsProvider.showAll();
              }
            },
            itemBuilder: ((_) => [
                  const PopupMenuItem(
                    child: Text('Only favorites'),
                    value: FilterOptions.Favorites,
                  ),
                  const PopupMenuItem(
                    child: Text('Show all'),
                    value: FilterOptions.All,
                  ),
                ]),
            icon: Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
              builder: (_, cart, ch) =>
                  Badge(value: cart.itemCount.toString(), child: ch!),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ))
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
