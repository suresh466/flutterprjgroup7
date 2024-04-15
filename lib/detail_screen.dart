import 'package:flutter/material.dart';
import 'main.dart';
import 'product.dart';
import 'products_screen.dart';
import 'cart_screen.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  DetailScreen({required this.product});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _size = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
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
                        tag: widget.product.picture,
                        child: Image(
                          image: AssetImage('images/products/${widget.product.picture}.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.product.name),
                      Text('\$${widget.product.price.toStringAsFixed(2)}'),
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
                  cartItems.add(widget.product);
                });
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    _size = !_size;
                  });
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.product.name} added to cart'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: const Text('Add to cart'),
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
                MaterialPageRoute(builder: (context) => MyHomePage()),
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