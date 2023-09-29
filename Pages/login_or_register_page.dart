import 'package:flutter/material.dart';
import 'package:mytest/Pages/login_page.dart';
import 'package:mytest/Pages/register_page.dart';

class LoginOrRegisterPAge extends StatefulWidget {
  const LoginOrRegisterPAge({super.key});

  @override
  State<LoginOrRegisterPAge> createState() => _LoginOrRegisterPAgeState();
}

class _LoginOrRegisterPAgeState extends State<LoginOrRegisterPAge> {

  bool showLoginPage = true;

  void togglePAges() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePAges,
      );
    } else {
      return RegisterPage(
        onTap: togglePAges,
      );
    }
  }
}












