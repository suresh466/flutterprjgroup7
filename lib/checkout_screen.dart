import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterprjgroup7/products_screen.dart';

import 'main.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _creditCardNumberController = TextEditingController();
  final _cvvController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double totalPrice = ModalRoute.of(context)?.settings.arguments as double;
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                  return 'Invalid First Name, only alphabets and spaces are allowed.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Last Name';
                }
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'Invalid Last Name, only alphabets are allowed.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                  return 'Invalid phone number. Please enter a 10-digit Number.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _creditCardNumberController,
              decoration: InputDecoration(labelText: 'Credit Card Number'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your credit card number';
                }
                if (!RegExp(r'^[0-9]{16}$').hasMatch(value)) {
                  return 'Invalid credit card number. Please enter a 16-digit number.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _cvvController,
              decoration: InputDecoration(labelText: 'CVV'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your CVV';
                }
                if (!RegExp(r'^[0-9]{3}$').hasMatch(value)) {
                  return 'Invalid CVV. Please enter a 3-digit number.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _streetController,
              decoration: InputDecoration(labelText: 'Street'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your street';
                }
                if (!RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(value)) {
                  return 'Invalid street name. Only numbers, letters, and spaces are allowed.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'City'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your city';
                }
                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                  return 'Invalid city name. Only alphabets and spaces are allowed.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _stateController,
              decoration: InputDecoration(labelText: 'Province'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your state';
                }
                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                  return 'Invalid state name. Only alphabets and spaces are allowed.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _postalController,
              decoration: InputDecoration(labelText: 'Postal Code'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your postal code';
                }
                if (!RegExp(r'^[a-zA-Z0-9]{6}$').hasMatch(value)) {
                  return 'Invalid Postal Code. Please enter a valid code with 6 characters.';
                }
                return null;
              },
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Order placed successfully')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  }
                },
                child: Text('Checkout - \$${totalPrice.toStringAsFixed(2)}'),
              ),
            )
          ],
        ),
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
