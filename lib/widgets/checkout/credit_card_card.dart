import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreditCardCard extends StatefulWidget {
  const CreditCardCard(this.holder, this.number, {Key? key}) : super(key: key);
  final String holder;
  final String number;
  @override
  State<CreditCardCard> createState() => _CreditCardCardState();
}

class _CreditCardCardState extends State<CreditCardCard> {
  bool _creditCard = false;
  @override
  Widget build(BuildContext context) {
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
          child: Radio<bool>(
            value: false,
            groupValue: _creditCard,
            onChanged: (bool? value) {
              _creditCard = value!;
            },
          ),
          // child: Container(
          //   width: 25,
          //   height: 25,
          //   padding: const EdgeInsets.all(5),
          //   decoration: BoxDecoration(
          //       color: Theme.of(context).colorScheme.onBackground,
          //       borderRadius: BorderRadius.circular(25),
          //       border: Border.all(
          //           color: Theme.of(context).colorScheme.onBackground,
          //           width: 1)),
          // ),
        )
      ]),
    );
  }
}
