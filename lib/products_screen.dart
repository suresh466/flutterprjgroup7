import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'product.dart';
import 'home_screen.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  final List<Product> products = [
    Product(1, 'Product 1', 10.0, 'assets/images/product1.png', 'This is product 1'),
    Product(2, 'Product 2', 20.0, 'assets/images/product2.png', 'This is product 2'),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(product: products[index])),
              );
            },
            child: Card(
              color: Colors.blue,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: products[index].picture,
                    child: Image(
                      width: 125,
                      height: 125,
                      image: AssetImage("images/products/${products[index].picture}"),
                    ),
                  ),
                  Text(products[index].name),
                  Text('\$${products[index].price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set the currentIndex to 1 for the 'Products' tab
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Cart',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductsScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}