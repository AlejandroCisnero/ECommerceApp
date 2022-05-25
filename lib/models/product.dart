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

class Features {
  Features(this.width, this.height, this.diagonal, this.potency);
  final int width;
  final int height;
  final int diagonal;
  final int potency;
}
