import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/ApplyController.dart';
import 'package:job_posting_application/Views/HomePage.dart';


class ApplyPage extends GetView<ApplyController> {

  const ApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final padding = screenWidth * 0.03;
    final verticalSpacing = screenHeight * 0.03;

    final ApplyController applyController = Get.put(ApplyController());

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
          "Apply",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Noir Pro',
            fontSize: 24,
            backgroundColor: Colors.black,
          ),
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

                TextField(
                  controller: applyController.nameController,
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
                const SizedBox(height: 10),

                TextField(
                  controller: applyController.emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Email',
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
                SizedBox(height: verticalSpacing),

                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await applyController.pickResume();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.3,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Obx(() => Text(
                          applyController.selectedResume.value != null
                              ? "Resume Selected"
                              : "Upload Resume",
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            fontFamily: 'Noir Pro',
                          ),
                        )),
                      ),
                      SizedBox(height: verticalSpacing),
                      ElevatedButton(
                        onPressed: () async {
                          await applyController.submitApplication();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.3,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Obx(() => Text(
                          applyController.isSubmitting.value
                              ? "Submitting..."
                              : "Apply",
                          style: TextStyle(
                            fontSize: screenHeight * 0.022,
                            fontFamily: 'Noir Pro',
                          ),
                        )),
                      ),
                    ],
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
