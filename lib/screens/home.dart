import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/providers/network.dart';
import 'package:e_commerce_app/screens/no_internet.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/widgets/footer_list.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
    return SafeArea(
      child: Scaffold(
          drawer: const Drawer(),
          backgroundColor: Colors.white,
          body: context.watch<Network>().isConnected
              ? Column(
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
                                child: Text(
                                  'Trending',
                                  style: GoogleFonts.mulish(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25),
                                  ),
                                ),
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
                                  return ProductCard(
                                      products[index].productName,
                                      products[index].productPrice,
                                      products[index].productIamgeUrl,
                                      products[index].productId);
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
                )
              : const NoInternet()),
    );
  }
}
