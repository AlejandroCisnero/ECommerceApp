import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard(this.productFeature, {Key? key}) : super(key: key);
  final int productFeature;
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
            productFeature.toString(),
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
