import 'package:flutter/material.dart';
import 'package:mytest/Services/auth_service.dart';
import 'package:mytest/compoenets/my_button.dart';
import 'package:mytest/compoenets/my_textfield.dart';
import 'package:mytest/compoenets/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {

    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        showErrorMsg("Incorrect Email");
      }
      else if (e.code == 'wrong-password') {
        showErrorMsg("Incorrect Password");
      }
    }
  }

  void showErrorMsg(String msg) {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              msg,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.brown[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
          
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
          
                const SizedBox(height: 50),
          
                const Text(
                  'Wellcom back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
          
                const SizedBox(height: 25),
          
                MyTextField(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                  ),
          
                const SizedBox(height: 10),
          
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
          
                const SizedBox(height: 10),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
          
                const SizedBox(height: 10),
          
                MYButton(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),
          
                const SizedBox(height: 50),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.brown[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                            // fontWeight: FontWeight.bold,
                            // fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.brown[400],
                        ),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 50),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/google.png'
                    ),
                    const SizedBox(width: 50),
                    SquareTile(
                      onTap: () {},
                      imagePath: 'lib/images/apple.png'
                    ),
                  ],
                ),
          
                const SizedBox(height: 50),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      )
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    )
                  ],
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}