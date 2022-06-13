import 'feature.dart';

class Product {
  Product(this.productName, this.productPrice, this.productIamgeUrl,
      this.productId, this.features, this.designer, this.materials);

  final String productId;
  final String productName;
  final String productIamgeUrl;
  final int productPrice;
  final Features features;
  final String designer;
  final String materials;
}
