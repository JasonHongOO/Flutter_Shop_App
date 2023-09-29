import 'package:flutter/material.dart';
import 'coffee.dart';


class CoffeeShop extends ChangeNotifier{
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: 'Long Black',
      price: '4.10',
      imagePath: 'lib/images/2.png',
    ),
    // latte
    Coffee(
      name: 'Latte Latte',
      price: '4.10',
      imagePath: 'lib/images/1.PNG',
    ),
    // espresso
    Coffee(
      name: 'Espresso',
      price: '4.10',
      imagePath: 'lib/images/1.PNG',
    ),
    // iced coffee
    Coffee(
      name: 'Iced Coffee',
      price: '4.10',
      imagePath: 'lib/images/1.PNG',
    ),
    // iced coffee
    Coffee(
      name: 'Iced Coffee',
      price: '4.10',
      imagePath: 'lib/images/1.PNG',
    ),
  ];
  // user cart
  final List<Coffee> _userCart = [];
  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }
  // remove item form cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

}