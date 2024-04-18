import 'package:flutter/material.dart';
import 'package:flutterprjgroup7/main.dart';
import 'detail_screen.dart';
import 'product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(1, 'Miniature Bat Mobile', 19.99, 'bat_mobile',
          'A detailed miniature replica of the iconic Bat Mobile.'),
      Product(2, 'Bat Grappler', 29.99, 'bat_grappler',
          "A fun replica of Batman's grappler. Not suitable for climbing."),
      Product(3, 'Batman Hoodie', 40.99, 'bat_hoodie',
          'High quality batman logo printed hoodie.'),
      Product(4, 'Printed Tshirt', 10.22, 'printed_tshirt',
          'A batman logo printed tshirt'),
      Product(5, 'Batman Model', 80.99, 'bat_model',
          'A series of limited edition batman toy'),
      Product(6, 'Joker collection', 120.99, 'joker_collection',
          'A limited edition batman collection'),
      Product(7, 'Batman Collection', 160.99, 'bat_collection',
          'Batman latest collection. Special discount included.'),
      Product(8, 'Batman costume', 20.99, 'bat_costume',
          'Batman costume for cosplay. Stretchable fabric. Sizes available!'),
      Product(9, 'Printed mug', 5.99, 'printed_mug', 'A batman logo printed mug'),
      Product(10, 'Decorative cupcakes', 2.99, 'decorative_cupcakes',
          'Decorative batman cupcakes. Made of rubber.'),
    ];

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
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(product: products[index])),
              );
            },
            child: Card(
              child: Row(
                children: [
                  Hero(
                    tag: products[index].picture,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        width: 125,
                        height: 125,
                        image: AssetImage(
                            'images/products/${products[index].picture}.jpg'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        products[index].name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '\$${products[index].price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
