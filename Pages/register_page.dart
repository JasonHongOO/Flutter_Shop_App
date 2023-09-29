import 'package:flutter/material.dart';
import 'package:mytest/Services/auth_service.dart';
import 'package:mytest/compoenets/my_button.dart';
import 'package:mytest/compoenets/my_textfield.dart';
import 'package:mytest/compoenets/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  void signUserUp() async {

    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text,
        );
      } else {
        Navigator.pop(context);
        showErrorMsg('Passwords don\'t match');
        return;
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMsg(e.code);
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
                const SizedBox(height: 30),
          
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
          
                const SizedBox(height: 30),
          
                const Text(
                  'Let\'s create an account for you',
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
          
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
          
                const SizedBox(height: 10),
          
                MYButton(
                  text: 'Sign Up',
                  onTap: signUserUp,
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
                    SizedBox(width: 50),
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
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      )
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
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