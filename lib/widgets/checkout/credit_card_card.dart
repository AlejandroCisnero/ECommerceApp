import 'package:e_commerce_app/providers/credit_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CreditCardCard extends StatefulWidget {
  CreditCardCard(
      this.creditCard, this.changeCreditCard, this.holder, this.number,
      {Key? key})
      : super(key: key);
  final String holder;
  final String number;
  String creditCard;
  void Function(String value) changeCreditCard;
  @override
  State<CreditCardCard> createState() => _CreditCardCardState();
}

class _CreditCardCardState extends State<CreditCardCard> {
  @override
  Widget build(BuildContext context) {
    String selectedCreditCard = Provider.of<CreditCards>(context).selectedCard;
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(children: [
        Container(
          margin:
              const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
          child: Center(child: const Icon(Icons.credit_card)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.holder),
              Text('****${widget.number.substring(15, 19)}'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Radio<String>(
            value: widget.holder,
            groupValue: selectedCreditCard,
            onChanged: (String? value) {
              Provider.of<CreditCards>(context, listen: false)
                  .changeSelectedCard(value!);
            },
          ),
        )
      ]),
    );
  }
}
