import 'package:e_commerce_app/clippers/product_detail_clipper.dart';
import 'package:e_commerce_app/providers/products.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  static const route = '/productDetail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final Product product =
        products.firstWhere((element) => element.productId == id);
    double height =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  child:
                      Container(child: Image.network(product.productIamgeUrl)),
                  clipper: ProductDetailClipper(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
