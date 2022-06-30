import 'package:e_commerce_app/screens/checkout/payment_screen.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(this.name, this.address, {Key? key}) : super(key: key);
  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(PaymentScreen.route);
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 5, right: 15),
                    child: const Icon(Icons.location_pin)),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(address)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: 25,
            endIndent: 25,
            color: Theme.of(context).colorScheme.onBackground,
          )
        ],
      ),
    );
  }
}
