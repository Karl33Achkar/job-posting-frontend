import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/PostJobController.dart';
import 'HomePage.dart';

class PostJob extends GetView<PostJobController> {
  const PostJob({super.key});

  @override
  Widget build(BuildContext context) {
    final PostJobController postJobController = PostJobController();


    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final padding = screenWidth * 0.03;
    final verticalSpacing = screenHeight * 0.03;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Get.to(() => const HomePage());
          },
        ),
        title: const Text(
          "Post A Job",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Noir Pro',
              fontSize: 24,
              backgroundColor: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: verticalSpacing),
                Text(
                  "Fill the form",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Noir Pro',
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),

                // Job Details Form Fields
                TextField(
                  controller: postJobController.jobNameController, // Bind controller
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Job Name',
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Noir Pro'
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.black, width: 3), // Focused border color
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing),
                TextField(
                  controller: postJobController.companyNameController, // Bind controller
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Company Name',
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Noir Pro'
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.black, width: 3), // Focused border color
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing),
                TextField(
                  controller: postJobController.countryController, // Bind controller
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Noir Pro'
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.black, width: 3), // Focused border color
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing),
                TextField(
                  controller: postJobController.salaryController, // Bind controller
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Salary',
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Noir Pro'
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.black, width: 3), // Focused border color
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing),

                Center(
                  child:ElevatedButton(
                    onPressed: postJobController.postJob,
                  style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Post',
              style: TextStyle(fontSize: 18, fontFamily: 'Noir Pro'),
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
