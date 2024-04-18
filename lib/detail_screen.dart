import 'package:flutter/material.dart';
import 'checkout_screen.dart';
import 'main.dart';
import 'product.dart';
import 'products_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;

  @override
  State<StatefulWidget> createState() =>
      _DetailScreenState(product: product);
}

class _DetailScreenState extends State<DetailScreen> {
  _DetailScreenState({required this.product});
  final Product product;
  bool _size = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AnimatedOpacity(
                    opacity: _size ? 1 : 0.25,
                    duration: const Duration(seconds: 1),
                    child: AnimatedContainer(
                      width: _size ? null : 200,
                      height: _size ? null : 200,
                      alignment: _size ? null: Alignment.topRight,
                      duration: const Duration(seconds: 1),
                      child: Hero(
                        tag: product.picture,
                        child: Image(
                          image: AssetImage('images/products/${product.picture}.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(product.name),
                      Text(product.description),
                      Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                setState(() {
                  _size = !_size;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen(totalPrice: product.price),
                    ),
                  );
                });
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    _size = !_size;
                  });
                });
              },
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // set the currentIndex to 1 for the 'Products' tab
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductsScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}