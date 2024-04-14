import 'product.dart';

class Cart {
  static List<Product> items = [];

  static void addToCart(Product product) {
    items.add(product);
  }
}