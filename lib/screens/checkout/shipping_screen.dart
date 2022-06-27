import 'package:e_commerce_app/providers/checkout_flow_provider.dart';
import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen(this.onShippingComplete, {Key? key}) : super(key: key);
  final void Function(String) onShippingComplete;

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: OutlinedButton(
            onPressed: () {
              Provider.of<CheckoutFlowProvider>(context, listen: false)
                  .setCheckoutFlow(CheckoutFlow.address);
              widget.onShippingComplete("Aqui ponela");
            },
            child: const Text("Agrega una direccion")),
      ),
    );
  }
}
