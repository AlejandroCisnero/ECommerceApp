import 'package:flutter/material.dart';

import 'feature.dart';

class Product with ChangeNotifier {
  String productId;
  String productName;
  String productIamgeUrl;
  int productPrice;
  Features features;
  String designer;
  String materials;
  bool isFavorite;
  Product(
      this.productName,
      this.productPrice,
      this.productIamgeUrl,
      this.productId,
      this.features,
      this.designer,
      this.materials,
      this.isFavorite);

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
