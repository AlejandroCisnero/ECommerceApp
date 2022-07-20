import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/libraries/lib_color_schemes.g.dart';
import 'package:e_commerce_app/providers/addresses.dart';
import 'package:e_commerce_app/providers/cart.dart';
import 'package:e_commerce_app/providers/checkout_flow_provider.dart';
import 'package:e_commerce_app/providers/credit_cards.dart';
import 'package:e_commerce_app/providers/network.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/checkout/create_address_screen.dart';
import 'package:e_commerce_app/screens/checkout/create_credit_card_screen.dart';
import 'package:e_commerce_app/screens/checkout/payment_screen.dart';
import 'package:e_commerce_app/screens/checkout/shipping_screen.dart';
import 'package:e_commerce_app/screens/home.dart';
import 'package:e_commerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Network()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => CheckoutFlowProvider()),
        ChangeNotifierProvider(create: (_) => Addresses()),
        ChangeNotifierProvider(create: (_) => CreditCards())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: darkColorScheme,
          textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: darkColorScheme.onBackground),
            headlineMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: darkColorScheme.onBackground),
            bodyMedium: GoogleFonts.mulish(
              textStyle:
                  TextStyle(fontSize: 16, color: darkColorScheme.onBackground),
            ),
            bodyLarge: GoogleFonts.mulish(
              textStyle: TextStyle(
                  fontSize: 20,
                  color: darkColorScheme.onBackground,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        home: const Home(),
        routes: {
          ProductDetail.route: (context) => const ProductDetail(),
          CartScreen.route: (context) => const CartScreen(),
          ShippingScreen.route: (context) => const ShippingScreen(),
          PaymentScreen.route: (context) => const PaymentScreen(),
          CreateAddressScreen.route: (context) => const CreateAddressScreen(),
          CreateCreditCardScreen.route: (context) => CreateCreditCardScreen()
        },
      ),
    );
  }
}
