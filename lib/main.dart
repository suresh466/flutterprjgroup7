import 'package:flutter/material.dart';
import 'products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BatCave',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellowAccent,
          primary: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BatCave'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = "BatCave"});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _rotated = false;
  bool _animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedRotation(
              turns: _rotated ? 1 : 0,
              duration: Duration(seconds: 1),
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                alignment: _animate ? Alignment.centerRight : null,
                child: Image.asset(
                  'images/logo.png',
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            ElevatedButton(
              child:
                  const Text('Start Shopping', style: TextStyle(fontSize: 18)),
              onPressed: () {
                setState(() {
                  _rotated = !_rotated;
                  _animate = !_animate;
                });
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductsScreen()),
                  );
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
