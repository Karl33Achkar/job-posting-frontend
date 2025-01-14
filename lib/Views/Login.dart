import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/LoginController.dart';
import 'Registration.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Get.to(() => const Registration());
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double horizontalPadding = constraints.maxWidth * 0.1;
          double fontSizeMultiplier = constraints.maxWidth / 400;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50 * fontSizeMultiplier),
                Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32 * fontSizeMultiplier,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Noir Pro'
                  ),
                ),
                SizedBox(height: 10 * fontSizeMultiplier),
                Text(
                  'Fill the form with your credentials',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16 * fontSizeMultiplier,
                      fontFamily: 'Noir Pro'
                  ),
                ),
                SizedBox(height: 40 * fontSizeMultiplier),
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Noir Pro',
                      fontSize: 16 * fontSizeMultiplier
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'Noir Pro',
                        fontSize: 16 * fontSizeMultiplier
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20 * fontSizeMultiplier),
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Noir Pro',
                      fontSize: 16 * fontSizeMultiplier
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'Noir Pro',
                        fontSize: 16 * fontSizeMultiplier
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 30 * fontSizeMultiplier),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      loginController.login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16 * fontSizeMultiplier),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18 * fontSizeMultiplier,
                          fontFamily: 'Noir Pro'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20 * fontSizeMultiplier),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Registration()),
                        );
                      },
                      child: Text(
                        "Don't Have an account? Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13 * fontSizeMultiplier,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Text(
                    //     'Reset Password',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 12 * fontSizeMultiplier,
                    //       fontFamily: 'Noir Pro',
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
