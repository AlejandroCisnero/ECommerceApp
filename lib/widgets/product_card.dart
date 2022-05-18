import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.productName, this.productPrice, this.productImageUrl,
      {Key? key})
      : super(key: key);
  final String productImageUrl;
  final String productName;
  final int productPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 220,
            height: 300,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(45)),
                child: Image.network(
                  productImageUrl,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productName,
            style: GoogleFonts.mulish(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(
              '€$productPrice',
              style: GoogleFonts.mulish(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
