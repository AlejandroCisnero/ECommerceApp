import 'package:e_commerce_app/models/cart_item.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  double _total = 0.00;

  double get total => _total;

  List<CartItem> get cartItems => [..._cartItems];

  void addItem(CartItem item) {
    //Check whether the item is already in the cart list
    if (_cartItems.any(
        (element) => element.product.productId == item.product.productId)) {
      int itemIndex = _cartItems.indexWhere(
          (element) => element.product.productId == item.product.productId);
      _cartItems[itemIndex].quantity++;
    } else {
      _cartItems.add(item);
    }
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
