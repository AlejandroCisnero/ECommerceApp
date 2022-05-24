import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/icons/bag_icon.svg',
            width: 16,
            height: 16,
          ),
          Text(
            '12 cm',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
