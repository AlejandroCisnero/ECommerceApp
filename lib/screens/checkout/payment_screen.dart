import 'dart:ffi';

import 'package:e_commerce_app/models/credit_card.dart';
import 'package:e_commerce_app/providers/credit_cards.dart';
import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:e_commerce_app/widgets/checkout/credit_card_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_credit_card_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static const route = '/checkout/delivery';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String creditCard = 'none';

  @override
  Widget build(BuildContext context) {
    List<CreditCard> creditCards =
        Provider.of<CreditCards>(context).creditCards;
    void changeCreditCard(String value) {
      setState(() {
        creditCard = value;
      });
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CreateCreditCardScreen.route);
          },
          child: const Icon(Icons.add),
        ),
      ),
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
                      var key = Key(creditCards[index].alias);
                      return CreditCardCard(
                        creditCard,
                        changeCreditCard,
                        creditCards[index].alias,
                        creditCards[index].number,
                        creditCards[index].icon,
                        key: key,
                      );
                    }),
              ),
              Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Continue')))
            ],
          )),
    );
  }
}
