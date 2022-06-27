import 'package:e_commerce_app/providers/checkout_flow_provider.dart';
import 'package:e_commerce_app/screens/checkout/create_address_screen.dart';
import 'package:e_commerce_app/screens/checkout/delivery_screen.dart';
import 'package:e_commerce_app/widgets/address_card.dart';
import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({Key? key}) : super(key: key);
  static const route = '/checkout/shipping';

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CreateAddressScreen.route);
          },
          child: const Icon(Icons.add),
        ),
        appBar: CheckoutAppbar('Shipping'),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: Text(
                'Where would you like us to send your purchases?',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            AddressCard(),
          ],
        ));
  }
}
