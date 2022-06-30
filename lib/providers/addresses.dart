import 'package:e_commerce_app/models/address.dart';
import 'package:flutter/cupertino.dart';

class Addresses with ChangeNotifier {
  List<Address> _addresses = [
    Address(
        id: 'a1',
        name: 'Moms house',
        address: '132, My Street, Kingston, New York 12401',
        zipCode: '1550',
        state: 'New York',
        city: 'Kingston',
        country: 'United States')
  ];

  get addresses => [..._addresses];
  void addAddress(Address address) {
    _addresses.add(address);
    notifyListeners();
  }
}
