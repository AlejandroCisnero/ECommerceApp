import 'package:flutter/material.dart';

class FooterList extends StatefulWidget {
  const FooterList({Key? key}) : super(key: key);

  @override
  State<FooterList> createState() => _FooterListState();
}

class _FooterListState extends State<FooterList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          )),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: TabBar(
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: [
                  Tab(text: 'Collections'),
                  Tab(text: 'New'),
                  Tab(text: 'Popular'),
                  Tab(text: 'Best Selling')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
