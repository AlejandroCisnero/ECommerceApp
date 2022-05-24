import 'package:e_commerce_app/clippers/product_detail_clipper.dart';
import 'package:e_commerce_app/providers/products.dart';
import 'package:e_commerce_app/widgets/description_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(child: Image.network(product.productIamgeUrl)),
              Container(
                margin: EdgeInsets.only(top: (height / 2) - 130),
                child: ClipPath(
                  child: Container(
                    color: Colors.white,
                  ),
                  clipper: ProductDetailClipper(),
                ),
              ),
              Positioned(
                top: (height / 2) - 40,
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Designer: ',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text('Yo mismo',
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Materials: ',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Text('Materiales pues',
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '€${product.productPrice}',
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DescriptionCard(),
                          DescriptionCard(),
                          DescriptionCard(),
                          DescriptionCard()
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
