import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/providers/network.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/no_internet.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/widgets/custom_drawer.dart';
import 'package:e_commerce_app/widgets/footer_list.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/feature.dart';
import '../models/product.dart';
import '../providers/products.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const route = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void checkInternetConnection(result) async {
    switch (result) {
      case ConnectivityResult.bluetooth:
        // TODO: Handle this case.
        break;
      case ConnectivityResult.wifi:
        Provider.of<Network>(context, listen: false).isConnected = true;
        break;
      case ConnectivityResult.ethernet:
        Provider.of<Network>(context, listen: false).isConnected = true;
        break;
      case ConnectivityResult.mobile:
        Provider.of<Network>(context, listen: false).isConnected = true;
        break;
      case ConnectivityResult.none:
        Provider.of<Network>(context, listen: false).isConnected = false;
        break;
    }
  }

  @override
  void initState() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      checkInternetConnection(result);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Products>(context).products;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          drawer: const CustomDrawer(),
          body: context.watch<Network>().isConnected
              ? SizedBox(
                  height: MediaQuery.of(context).size.height +
                      kBottomNavigationBarHeight,
                  child: Column(
                    children: [
                      const CustomAppBar(),
                      Expanded(
                        child: ListView(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 15),
                                  child: Text('Trending',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(right: 20, top: 25),
                                  child: Text(
                                    'See All',
                                    style: GoogleFonts.mulish(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
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
                                    return ChangeNotifierProvider(
                                        create: (context) => Product(
                                            products[index].productName,
                                            products[index].productPrice,
                                            products[index].productIamgeUrl,
                                            products[index].productId,
                                            products[index].features,
                                            products[index].designer,
                                            products[index].materials,
                                            products[index].isFavorite),
                                        child: const ProductCard());
                                  }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const FooterList()
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const NoInternet()),
    );
  }
}
