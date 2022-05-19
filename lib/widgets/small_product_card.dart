import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class SmallProductCard extends StatelessWidget {
  const SmallProductCard(this.productName, this.productImageUrl, {Key? key})
      : super(key: key);
  final String productImageUrl;
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 15, top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 130,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: productImageUrl,
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            productName,
            style: GoogleFonts.mulish(
              textStyle: TextStyle(
                  overflow: TextOverflow.fade,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
