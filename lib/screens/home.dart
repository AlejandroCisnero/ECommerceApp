import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/widgets/footer_list.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/products.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const CustomAppBar(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'Trending',
                    style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20, top: 25),
                  child: Text(
                    'See All',
                    style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 400,
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        products[index].productName,
                        products[index].productPrice,
                        products[index].productIamgeUrl);
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            const FooterList()
          ],
        ),
      ),
    );
  }
}
