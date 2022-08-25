import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/providers/products_provider.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final loadedProducts = productsProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: loadedProducts.length,
      itemBuilder: (ctc, i) => ProductItem(product: loadedProducts[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
    );
  }
}
