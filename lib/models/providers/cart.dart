import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class CartItem {
  final String id;
  final Product product;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.product,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    return _items.entries.fold(0, (previousValue, mapEntry) {
      final cartItem = mapEntry.value;

      return cartItem.product.price * cartItem.quantity;
    });
  }

  void AddItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (value) => CartItem(
              id: product.id,
              product: product,
              quantity: value.quantity + 1,
              price: value.price));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
              id: DateTime.now().toString(),
              product: product,
              quantity: 1,
              price: product.price));
    }

    notifyListeners();
  }
}
