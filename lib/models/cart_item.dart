import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class CartItem {
  CartItem(this.id, this.product, this.quantity);
  final String id;
  final Product product;
  int quantity;
}
