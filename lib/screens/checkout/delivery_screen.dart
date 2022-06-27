import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:flutter/material.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({Key? key}) : super(key: key);
  static const route = '/checkout/delivery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CheckoutAppbar('Deliver address'),
      body: Center(
        child: const Text('Dale dale'),
      ),
    );
  }
}
