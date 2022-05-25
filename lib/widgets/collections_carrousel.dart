import 'package:e_commerce_app/providers/products.dart';
import 'package:e_commerce_app/widgets/small_product_card.dart';
import 'package:flutter/material.dart';

class CollectionsCarrousel extends StatelessWidget {
  const CollectionsCarrousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: ((context, index) {
        return SmallProductCard(products[index].productName,
            products[index].productIamgeUrl, products[index].productId);
      }),
    );
  }
}
