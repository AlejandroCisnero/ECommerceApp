import 'package:e_commerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute(product.productId));
      },
      child: Container(
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
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: product.productIamgeUrl,
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              product.productName,
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
                '€${product.productPrice}',
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
      ),
    );
  }
}

Route _createRoute(String productId) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ProductDetail(productId: productId),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);
      var curveTween = CurveTween(curve: curve);
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
