import 'package:flutter/material.dart';

class CheckoutAppbar extends StatelessWidget {
  const CheckoutAppbar(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        onPressed: () {},
      ),
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    );
  }
}
