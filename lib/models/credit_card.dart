import 'package:e_commerce_app/providers/credit_cards.dart';

class CreditCard {
  CreditCard(
      this.holder, this.number, this.expirationDate, this.cvc, this.alias,
      {this.icon = CreditsCard.green});
  String holder;
  String number;
  String expirationDate;
  String cvc;
  String alias;
  Enum icon;
}
