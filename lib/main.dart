// main.dart
import 'package:flutter/material.dart';
import 'package:flutterprjgroup7/product.dart';
import 'home_screen.dart';

// a product list for cartItems
List<Product> cartItems = [];

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}