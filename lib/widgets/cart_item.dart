import 'package:e_commerce_app/screens/product_detail.dart';
import 'package:e_commerce_app/widgets/quantity_button.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class CartItem extends StatelessWidget {
  const CartItem(this.itemId, this.product, this.quantity, {Key? key})
      : super(key: key);
  final String itemId;
  final Product product;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: screenSize.width,
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProductDetail.route,
                          arguments: product.productId);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.network(product.productIamgeUrl))),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 90,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.productName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .merge(TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text(
                                '${product.productPrice} €',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .merge(
                                      TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.bold),
                                    ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Dimensions: '),
                              Text(
                                  '${product.features.height}h, ${product.features.width}w')
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Qty'),
                              QuantityButton(itemId)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                indent: 25,
                endIndent: 25,
                thickness: 0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
