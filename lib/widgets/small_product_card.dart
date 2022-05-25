import 'package:e_commerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class SmallProductCard extends StatelessWidget {
  const SmallProductCard(this.productName, this.productImageUrl, this.productId,
      {Key? key})
      : super(key: key);
  final String productId;
  final String productImageUrl;
  final String productName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetail.route, arguments: productId);
      },
      child: Container(
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
                textStyle: const TextStyle(
                    overflow: TextOverflow.fade,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
