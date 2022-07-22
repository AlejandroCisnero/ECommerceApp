import 'package:e_commerce_app/providers/credit_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCardColorSelector extends StatefulWidget {
  const CreditCardColorSelector({Key? key}) : super(key: key);

  @override
  State<CreditCardColorSelector> createState() =>
      _CreditCardColorSelectorState();
}

class _CreditCardColorSelectorState extends State<CreditCardColorSelector> {
  Enum selectedCard = CreditsCard.green;

  void changeCreditCardColor(Enum color) {
    setState(() {
      selectedCard = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () => changeCreditCardColor(CreditsCard.green),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: selectedCard == CreditsCard.green
                        ? Theme.of(context).colorScheme.onBackground
                        : Colors.transparent),
                child: SvgPicture.asset(
                  'assets/icons/green-credit-card.svg',
                  height: 60,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => changeCreditCardColor(CreditsCard.blue),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: selectedCard == CreditsCard.blue
                        ? Theme.of(context).colorScheme.onBackground
                        : Colors.transparent),
                child: SvgPicture.asset(
                  'assets/icons/blue-credit-card.svg',
                  height: 60,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => changeCreditCardColor(CreditsCard.black),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: selectedCard == CreditsCard.black
                        ? Theme.of(context).colorScheme.onBackground
                        : Colors.transparent),
                child: SvgPicture.asset(
                  'assets/icons/black-credit-card.svg',
                  height: 60,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => changeCreditCardColor(CreditsCard.red),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: selectedCard == CreditsCard.red
                        ? Theme.of(context).colorScheme.onBackground
                        : Colors.transparent),
                child: SvgPicture.asset(
                  'assets/icons/red-credit-card.svg',
                  height: 60,
                ),
              ),
            )
          ]),
    );
  }
}
