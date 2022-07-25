import 'package:e_commerce_app/models/credit_card.dart';
import 'package:flutter/cupertino.dart';

enum CreditsCard { red, black, blue, green }

class CreditCards with ChangeNotifier {
  List<CreditCard> _creditCards = [
    CreditCard('Manuel Alejandro Davila Cisnero', '4896-5698-7845-2135',
        '08/22', '338', 'Universitaria'),
    CreditCard('Manuel Alejandro Davila Cisnero', '4896-5698-7845-2135',
        '08/22', '338', 'Planilla',
        icon: CreditsCard.black)
  ];

  String _selectedCard = '';

  get selectedCard => _selectedCard;

  void changeSelectedCard(String value) {
    _selectedCard = value;
    notifyListeners();
  }

  get creditCards => [..._creditCards];

  void addCreditCard(String holder, String number, String expirationDate,
      String cvc, String alias, Enum icon) {
    CreditCard creditCard =
        CreditCard(holder, number, expirationDate, cvc, alias, icon: icon);
    _creditCards.add(creditCard);
    notifyListeners();
  }
}
