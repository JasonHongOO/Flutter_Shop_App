import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          color: Colors.brown[300],
          activeColor: Colors.white,
          tabBackgroundColor: Colors.brown.shade200,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.white),
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Shop',
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Cart',
            ),
          ]),
    );
  }
}
