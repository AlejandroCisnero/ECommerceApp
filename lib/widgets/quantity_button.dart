import 'package:e_commerce_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart.dart';

// ignore: must_be_immutable
class QuantityButton extends StatefulWidget {
  QuantityButton(this.cartItemId, {Key? key}) : super(key: key);
  String cartItemId;
  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  @override
  Widget build(BuildContext context) {
    CartItem cartItem = Provider.of<Cart>(context)
        .cartItems
        .firstWhere((element) => element.id == widget.cartItemId);
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.onBackground)),
      height: 30,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (cartItem.quantity > 1) {
                setState(() {
                  //cartItem.quantity--;
                  Provider.of<Cart>(context, listen: false)
                      .modifyCartItemQuantity(false, cartItem.id);
                });
              }
            },
            child: const Icon(Icons.remove),
          ),
          Text('${cartItem.quantity}'),
          GestureDetector(
            onTap: () {
              setState(() {
                //cartItem.quantity++;
                Provider.of<Cart>(context, listen: false)
                    .modifyCartItemQuantity(true, cartItem.id);
              });
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
