import 'package:e_commerce_app/models/payment.dart';
import 'package:e_commerce_app/models/product.dart';

class Order {
  Order(this.addressId, this.payment, this.productsQuantity);

  String addressId;
  Payment payment;
  int productsQuantity;
}
