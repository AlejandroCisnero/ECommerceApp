import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/libraries/lib_color_schemes.g.dart';
import 'package:e_commerce_app/providers/cart.dart';
import 'package:e_commerce_app/providers/network.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
      ],
      child: MaterialApp(
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
          ),
        ),
        home: const Home(),
        routes: {
          ProductDetail.route: (context) => const ProductDetail(),
          CartScreen.route: (context) => const CartScreen()
        },
      ),
    );
  }
}
