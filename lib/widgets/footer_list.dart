import 'package:flutter/material.dart';

class FooterList extends StatefulWidget {
  const FooterList({Key? key}) : super(key: key);

  @override
  State<FooterList> createState() => _FooterListState();
}

class _FooterListState extends State<FooterList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
            )),
      ),
    );
  }
}
