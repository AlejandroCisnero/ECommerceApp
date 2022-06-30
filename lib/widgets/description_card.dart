import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum descriptionType { height, width, diagonal, potency }

class DescriptionCard extends StatelessWidget {
  const DescriptionCard(this.productFeature, this.description, {Key? key})
      : super(key: key);
  final int productFeature;
  final descriptionType description;
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
          if (description == descriptionType.height)
            SvgPicture.asset(
              'assets/icons/ruler-vertical.svg',
              width: 16,
              height: 16,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          if (description == descriptionType.width)
            SvgPicture.asset(
              'assets/icons/ruler-horizontal.svg',
              width: 16,
              height: 16,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          if (description == descriptionType.diagonal)
            SvgPicture.asset(
              'assets/icons/ruler-solid.svg',
              width: 16,
              height: 16,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          if (description == descriptionType.potency)
            SvgPicture.asset(
              'assets/icons/bolt-solid.svg',
              width: 16,
              height: 16,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          Text(
            '$productFeature ${description == descriptionType.potency ? 'W' : 'cm'}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          )
        ],
      ),
    );
  }
}
