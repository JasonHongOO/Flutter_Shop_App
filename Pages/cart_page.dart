import 'package:flutter/material.dart';
import 'package:mytest/models/coffee_shop.dart';
import 'package:provider/provider.dart';
import 'package:mytest/models/coffee.dart';
import 'package:mytest/compoenets/coffee_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);

    showDialog(
      context:context, 
      builder: (context) => const AlertDialog(
        title: Text("Successfully deleted from cart")
      ),
    );
  }

  void payNow() {
    showDialog(
      context:context, 
      builder: (context) => const AlertDialog(
        title: Text("Successfully pay")
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "Cart", 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {

                    Coffee eachCoffee = value.userCart[index];

                    return CoffeeTile(
                      coffee: eachCoffee, 
                      onPressed: () => removeFromCart(eachCoffee),
                      icon: const Icon(Icons.delete),
                    );
                  }
                ),
              ),

              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
