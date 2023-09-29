import 'package:flutter/material.dart';
import 'package:mytest/models/coffee_shop.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class OrderPage extends StatefulWidget {
  final Coffee coffee;
  const OrderPage({
    super.key,
    required this.coffee,  
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  void addToCart() {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(widget.coffee);

    Navigator.pop(context);

    showDialog(
      context:context, 
      builder: (context) => const AlertDialog(
        title: Text("Successfully added to cart")
      ),
    );
  }


  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.coffee.name)),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          Image.asset(widget.coffee.imagePath),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Sweet')
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                      )
                    )
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Ice'),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                      )
                    )
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Pearls'),
                    ),
                    Expanded(
                      child: Slider(
                        value: pearlValue,
                        label: pearlValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePearl(value),
                      )
                    )
                  ],
                ),
              ],
            ),
          ),

          MaterialButton(
            color: Colors.brown,
            onPressed: addToCart,
            child: const Text(
              'Add to cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )
    );
  }
}