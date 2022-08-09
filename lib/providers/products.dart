import 'package:flutter/cupertino.dart';

import '../models/feature.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
        'Triple lamp',
        300,
        'https://img1.homary.com/filters:format(webp)/mall/file/2021/08/17/d7e4423574e9406e80d4be4a8dde748f.jpg',
        'p1',
        Features(10, 60, 75, 10),
        'Jeniffer Doe',
        'Plastic',
        false),
    Product(
        'Pendant lamps',
        400,
        'https://secure.img1-fg.wfcdn.com/im/40793563/resize-h600-w600%5Ecompr-r85/7527/75270414/.jpg',
        'p2',
        Features(20, 100, 110, 15),
        'Manuel Alejandro Davila',
        'Plastic, Rope',
        false),
    Product(
        'Night Lamp',
        120,
        'https://www.ubuy.com.ni/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjFqWlMteElSblMuX0FDX1NMMTUwMF8uanBn.jpg',
        'p3',
        Features(5, 45, 47, 5),
        'Anielka Smith',
        'Plastic, Crystal',
        false),
    Product(
        'Asian Lamp',
        250,
        'https://www.scandinaviandesign.com/wp-content/uploads/2021/10/279113_turner_65_pendant_pholc_broberg_ridderstrale_1500x1500_8.jpg',
        'p4',
        Features(40, 40, 40, 5),
        'Fang Yu',
        'Paper, Rope, Plastic',
        false),
    Product(
        'Snake styled',
        80,
        'https://m.media-amazon.com/images/I/61K5lO4yQVL._AC_SX466_.jpg',
        'p5',
        Features(5, 45, 47, 10),
        'Hideo Kojima',
        'Wood, Metal, Plastic',
        false),
    Product(
        'Moon',
        250,
        'https://cdn.shopify.com/s/files/1/0504/1140/5483/products/il_1588xN.2600566438_lqeq.jpg?v=1620253829',
        'p6',
        Features(30, 30, 30, 20),
        'Jhon Doe',
        'Plastic, Wood',
        false),
    Product(
        'Lava Lamp',
        80,
        'https://www.menkind.co.uk/media/catalog/product/cache/84a9762dea65cd4d66747ad9a34bdb64/g/r/graffiti_lava_lamp_60701_3_.jpg',
        'p7',
        Features(15, 45, 50, 15),
        'Manuel Alejandro Davila',
        'Plastic, Metal, Lava',
        false)
  ];

  List<Product> get products => [..._products];
}
