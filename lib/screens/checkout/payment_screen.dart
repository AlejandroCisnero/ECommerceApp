import 'package:e_commerce_app/models/credit_card.dart';
import 'package:e_commerce_app/providers/credit_cards.dart';
import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:e_commerce_app/widgets/checkout/credit_card_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static const route = '/checkout/delivery';
  @override
  Widget build(BuildContext context) {
    List<CreditCard> creditCards =
        Provider.of<CreditCards>(context).creditCards;
    return Scaffold(
      appBar: CheckoutAppbar('Payment method'),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: creditCards.length,
                    itemBuilder: (context, index) {
                      return CreditCardCard(
                          creditCards[index].alias, creditCards[index].number);
                    }),
              ),
              Container(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Continue')))
            ],
          )),
    );
  }
}
