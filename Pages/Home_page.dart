import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytest/Pages/shop_page.dart';
import 'package:mytest/Pages/cart_page.dart';
import 'package:mytest/compoenets/bottom_nav_bar.dart';
import 'package:mytest/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index; // Update the state inside setState
    });
  }

  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final List<Widget> _pages= [
    //shop
    const ShopPage(),
    //cart
    const CartPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar:  MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.brown[400],
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        )
      ),
      drawer: Drawer(
        backgroundColor: Colors.brown[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'lib/images/2.png',
                    color: Colors.white,
                  )
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.home, 
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home : ' + user.email!,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left:25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info, 
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left:25.0, bottom: 25),
              child: ListTile(
                leading: IconButton(
                  onPressed: signUserOut,
                  icon: const Icon(
                    Icons.logout, 
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
      body: _pages[selectedIndex],
    );
  }
}

