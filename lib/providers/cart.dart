import 'package:e_commerce_app/models/cart_item.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';

import '../models/feature.dart';

class Cart with ChangeNotifier {
  final List<CartItem> _cartItems = [
    CartItem(
        'ci1',
        Product(
            'Lampara triple',
            300,
            'https://img1.homary.com/filters:format(webp)/mall/file/2021/08/17/d7e4423574e9406e80d4be4a8dde748f.jpg',
            'p1',
            Features(10, 60, 75, 10),
            'Jeniffer Doe',
            'Plastic'),
        2)
  ];

  double _total = 0.00;

  double get total => _total;

  List<CartItem> get cartItems => [..._cartItems];

  void addItem(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void modifyCartItemQuantity(bool operation, String cartItemId) {
    if (operation) {
      _cartItems.firstWhere((cartItem) => cartItem.id == cartItemId).quantity++;
      computeTotal();
      notifyListeners();
    } else {
      _cartItems.firstWhere((cartItem) => cartItem.id == cartItemId).quantity--;
      computeTotal();
      notifyListeners();
    }
  }

  void computeTotal() {
    _total = 0.00;
    for (var element in _cartItems) {
      _total += element.quantity * element.product.productPrice;
    }
  }
}
