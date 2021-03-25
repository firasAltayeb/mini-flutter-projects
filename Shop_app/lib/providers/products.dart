import 'package:shop_app/models/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  void addProducts() {
    // _items.add(value);
    notifyListeners();
  }
}
