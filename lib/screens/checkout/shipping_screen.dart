import 'package:flutter/material.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen(this.onShippingComplete, this.exitSetup, {Key? key})
      : super(key: key);
  final void Function(String) onShippingComplete;
  final Future<bool> Function() exitSetup;

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(
            "Shipping",
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              widget.exitSetup();
            },
            color: Theme.of(context).colorScheme.onBackground,
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        Center(
          child: OutlinedButton(
              onPressed: () {
                widget.onShippingComplete("Aqui ponela");
              },
              child: const Text("Agrega una direccion")),
        ),
      ],
    );
  }
}
