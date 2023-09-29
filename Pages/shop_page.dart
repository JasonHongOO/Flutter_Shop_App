import 'package:flutter/material.dart';
import 'package:mytest/Pages/order_page.dart';
import 'package:mytest/compoenets/coffee_tile.dart';
import 'package:mytest/models/coffee_shop.dart';
import 'package:provider/provider.dart';
import 'package:mytest/models/coffee.dart';


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context:context, 
      builder: (context) => const AlertDialog(
        title: Text("Successfully added to cart")
      ),
    );
  }

  void goToOrderPage(Coffee coffee) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => OrderPage(
          coffee: coffee
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop> (
      builder: (context, value, child) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const Text(
                  "How would you like your coffee?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),     //讓物件之間有間隔

                Expanded(child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.coffeeShop[index];

                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () => goToOrderPage(eachCoffee),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
    );
  }
}
