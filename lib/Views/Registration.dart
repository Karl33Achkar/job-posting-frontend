import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../Controllers/RegistrationController.dart';
import 'Login.dart';

class Registration extends GetView<RegistrationController> {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final padding = screenWidth * 0.03;
    final verticalSpacing = screenHeight * 0.03;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(  // Added SingleChildScrollView
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Job Posting App",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Noir Pro',
                  ),
                ),
                SizedBox(height: verticalSpacing),
                Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Noir Pro',
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Fill the form with your credentials",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: screenHeight * 0.02,
                    fontFamily: 'Noir Pro'
                  ),
                ),
                SizedBox(height: verticalSpacing * 2),
                TextField(
                  controller: controller.name,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white,  fontFamily: 'Noir Pro'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: screenHeight * 0.02,
                      fontFamily: 'Noir Pro'
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing),
                TextField(
                  controller: controller.email,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white,  fontFamily: 'Noir Pro'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: screenHeight * 0.02,
                      fontFamily: 'Noir Pro'
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing),
                TextField(
                  controller: controller.password,
                  cursorColor: Colors.white,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white,  fontFamily: 'Noir Pro'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: screenHeight * 0.02,
                      fontFamily: 'Noir Pro'
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing * 2),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.register();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.3,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: screenHeight * 0.022,  fontFamily: 'Noir Pro'),
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      "Have an account? Login",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: screenHeight * 0.02,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
