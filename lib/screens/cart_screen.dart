import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const route = '/cart';
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height - kBottomNavigationBarHeight,
      ),
    );
  }
}
