import 'package:e_commerce_app/providers/credit_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CreditCardCard extends StatefulWidget {
  CreditCardCard(this.creditCard, this.changeCreditCard, this.holder,
      this.number, this.icon,
      {Key? key})
      : super(key: key);
  final String holder;
  final String number;
  final Enum icon;
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
          child: Center(
              child: SvgPicture.asset(
            'assets/icons/${widget.icon.name}-credit-card.svg',
            height: 45,
          )),
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
