import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:flutter/material.dart';

class CreateCreditCard extends StatelessWidget {
  const CreateCreditCard({Key? key}) : super(key: key);
  static const route = '/createCreditCard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CheckoutAppbar('Add a credit card'),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Text('Dale papuh esa tarjeta'),
        ),
      ),
    );
  }
}
