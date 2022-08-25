import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productId = ModalRoute.of(context)?.settings.arguments as String;
    var loadedProduct =
        Provider.of<ProductsProvider>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
    );
  }
}
