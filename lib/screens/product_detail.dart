import 'dart:developer';

import 'package:e_commerce_app/clippers/product_detail_clipper.dart';
import 'package:e_commerce_app/providers/products.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/widgets/description_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Hero(
                  tag: product.productId,
                  child: Image.network(product.productIamgeUrl)),
              Positioned.fill(
                top: (height / 2) - (height * 0.18),
                child: ClipPath(
                  child: Container(
                    padding: const EdgeInsets.only(top: 100),
                    color: Colors.white,
                    width: width,
                    height: height * 0.62,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Designer: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  Text(product.designer,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text('Materials: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium),
                                  Text(product.materials,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          width: width,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DescriptionCard(product.features.height,
                                  descriptionType.height),
                              DescriptionCard(product.features.width,
                                  descriptionType.width),
                              DescriptionCard(product.features.diagonal,
                                  descriptionType.diagonal),
                              DescriptionCard(
                                product.features.potency,
                                descriptionType.potency,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      dismissDirection:
                                          DismissDirection.startToEnd,
                                      action: SnackBarAction(
                                          textColor: Colors.white,
                                          label: 'Go to cart',
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, CartScreen.route);
                                          }),
                                      padding: const EdgeInsets.all(0),
                                      content: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                        child: const Center(
                                          child: Text(
                                            'Product Added!',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 50, top: 10, bottom: 25, right: 60),
                                  child: SvgPicture.asset(
                                    'assets/icons/bag_icon.svg',
                                    width: 32,
                                    height: 32,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    log('This is going to log');
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        'Buy Now',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .merge(const TextStyle(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(40)),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  clipper: ProductDetailClipper(),
                ),
              ),
              // Positioned(
              //   top: (height / 2),
              //   height: (height / 2) + 40,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.only(left: 20),
              //         width: width,
              //         child: Column(
              //           mainAxisSize: MainAxisSize.max,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               product.productName,
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 26,
              //                   color:
              //                       Theme.of(context).colorScheme.onBackground),
              //             ),
              //             const SizedBox(
              //               height: 10,
              //             ),
              //             Row(
              //               children: [
              //                 Text(
              //                   'Designer: ',
              //                   style:
              //                       Theme.of(context).textTheme.headlineMedium,
              //                 ),
              //                 Text(product.designer,
              //                     style: Theme.of(context).textTheme.bodyMedium)
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 10,
              //             ),
              //             Row(
              //               children: [
              //                 Text('Materials: ',
              //                     style: Theme.of(context)
              //                         .textTheme
              //                         .headlineMedium),
              //                 Text(product.materials,
              //                     style: Theme.of(context).textTheme.bodyMedium)
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 20,
              //             ),
              //             Text(
              //               '€${product.productPrice}',
              //               style: GoogleFonts.mulish(
              //                 textStyle: TextStyle(
              //                     fontWeight: FontWeight.w800,
              //                     fontSize: 22,
              //                     color: Theme.of(context).colorScheme.primary),
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 20,
              //             ),
              //           ],
              //         ),
              //       ),
              //       Container(
              //         padding: EdgeInsets.symmetric(horizontal: 5),
              //         width: width,
              //         child: Row(
              //           mainAxisSize: MainAxisSize.max,
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             DescriptionCard(product.features.height),
              //             DescriptionCard(product.features.width),
              //             DescriptionCard(product.features.diagonal),
              //             DescriptionCard(product.features.potency)
              //           ],
              //         ),
              //       ),
              //       Expanded(child: Container()),
              //       SizedBox(
              //         width: width,
              //         child: Row(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.only(
              //                   left: 50, top: 10, bottom: 25, right: 60),
              //               child: SvgPicture.asset(
              //                 'assets/icons/bag_icon.svg',
              //                 width: 32,
              //                 height: 32,
              //                 color: Theme.of(context).colorScheme.primary,
              //               ),
              //             ),
              //             Expanded(
              //               child: InkWell(
              //                 onTap: () {
              //                   log('This is going to log');
              //                 },
              //                 child: Container(
              //                   child: Center(
              //                     child: Text(
              //                       'Buy Now',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .headlineLarge!
              //                           .merge(const TextStyle(
              //                               color: Colors.white)),
              //                     ),
              //                   ),
              //                   height: 70,
              //                   decoration: BoxDecoration(
              //                       borderRadius: const BorderRadius.only(
              //                           topLeft: Radius.circular(40)),
              //                       color:
              //                           Theme.of(context).colorScheme.primary),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
