import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/ProfileController.dart';
import 'package:job_posting_application/Views/Registration.dart';
import 'HomePage.dart';
import 'JobsPage.dart';
import 'WishlistPage.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Noir Pro',
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Change Your Profile',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Noir Pro',
                ),
              ),
              const SizedBox(height: 30),

              // Full Name TextField
              TextField(
                controller: controller.name,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noir Pro',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Email Address TextField
              TextField(
                controller: controller.email,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noir Pro',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password fields
              TextField(
                controller: controller.password,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noir Pro',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Noir Pro',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.change();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Noir Pro',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16), // Add spacing between the rows
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const Registration());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                      ),
                      child: const Text(
                        'Re-Sign in/Re-Log in',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Noir Pro',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => const HomePage());
                },
                icon: Image.asset('images/home.png'),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => JobsPage());
                },
                icon: Image.asset('images/jobs.png'),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => const WishlistPage());
                },
                icon: Image.asset('images/likes.png'),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => const ProfilePage());
                },
                icon: Image.asset('images/black_account.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
