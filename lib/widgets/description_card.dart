import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset('assets/icons/bag_icon.svg'),
            Text('12 cm')
          ],
        ),
      ),
    );
  }
}
