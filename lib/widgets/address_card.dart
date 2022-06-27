import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 5, right: 15),
                  child: const Icon(Icons.location_pin)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text('Location Address')
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: Theme.of(context).colorScheme.onBackground,
        )
      ],
    );
  }
}
