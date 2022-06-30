import 'package:e_commerce_app/models/cart_item.dart';
import 'package:e_commerce_app/routes/checkout.dart';
import 'package:e_commerce_app/screens/checkout/shipping_screen.dart';
import 'package:e_commerce_app/widgets/cart_item.dart' as wci;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/addresses.dart';
import '../providers/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const route = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0.00;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<Cart>(context, listen: false).computeTotal();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<CartItem> cartItems = Provider.of<Cart>(context).cartItems;
    double total = Provider.of<Cart>(context).total;
    return Scaffold(
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (ctx, index) {
                    return wci.CartItem(cartItems[index].id,
                        cartItems[index].product, cartItems[index].quantity);
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total'),
                      Text('$total €'),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(screenSize.width - 20, 40))),
                    onPressed: () {
                      Navigator.of(context).pushNamed(ShippingScreen.route);
                    },
                    child: const Text(
                      'Buy',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
