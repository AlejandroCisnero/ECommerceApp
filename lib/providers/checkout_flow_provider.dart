import 'package:flutter/widgets.dart';

enum CheckoutFlow { shipping, address, payment, placeOrder }

class CheckoutFlowProvider with ChangeNotifier {
  CheckoutFlow _checkoutFlow = CheckoutFlow.shipping;

  void setCheckoutFlow(CheckoutFlow checkoutFlow) {
    _checkoutFlow = checkoutFlow;
    notifyListeners();
  }

  get getCheckoutFlow => _checkoutFlow;
}
