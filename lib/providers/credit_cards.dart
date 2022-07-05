import 'package:e_commerce_app/models/credit_card.dart';
import 'package:flutter/cupertino.dart';

class CreditCards with ChangeNotifier {
  List<CreditCard> _creditCards = [
    CreditCard('Manuel Alejandro Davila Cisnero', '4896-5698-7845-2135',
        '08/22', '338', 'Universitaria'),
    CreditCard('Manuel Alejandro Davila Cisnero', '4896-5698-7845-2135',
        '08/22', '338', 'Planilla')
  ];

  String _selectedCard = '';

  get selectedCard => _selectedCard;

  void changeSelectedCard(String value) {
    _selectedCard = value;
    notifyListeners();
  }

  get creditCards => [..._creditCards];
}
