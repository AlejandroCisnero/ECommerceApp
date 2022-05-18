import 'package:flutter/cupertino.dart';

class Network with ChangeNotifier {
  bool _isConnected = true;
  bool get isConnected => _isConnected;
  set isConnected(bool value) {
    _isConnected = value;
    notifyListeners();
  }
}
