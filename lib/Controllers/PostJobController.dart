import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../Core/Network/DioClient.dart';
import '../Models/Jobs.dart';
import '../Controllers/HomeController.dart';

class PostJobController extends GetxController {
  var jobNameController = TextEditingController();
  var companyNameController = TextEditingController();
  var countryController = TextEditingController();
  var salaryController = TextEditingController();
  var logoImage = Rxn<File>();

  final HomeController homeController = Get.find<HomeController>();

  Future<void> postJob() async {
    // Create a new job instance
    Jobs newJob = Jobs(
      jobName: jobNameController.text,
      companyName: companyNameController.text,
      countryName: countryController.text,
      salary: salaryController.text,
      // url: logoImage.value?.path, // Assuming you want to store the logo path
    );

    try {
      // Make the POST request with JSON data
      final response = await DioClient().getInstance().post("http://x.x.x.x:8000/api/postjobs", // Adjust this URL as needed
        data: newJob.toJson(), // Convert the Jobs object to JSON
        options: dio.Options(
          headers: {
            'Content-Type': 'application/json', // Set the content type to JSON
            // 'Authorization': 'Bearer YOUR_TOKEN', // Uncomment if you need to send an auth token
          },
        ),
      );

      // Check the response
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, add the job to the home controller
        homeController.addJob(newJob);

        // Optionally, clear the fields after posting
        jobNameController.clear();
        companyNameController.clear();
        countryController.clear();
        salaryController.clear();
        logoImage.value = null; // Reset logo

        // Navigate back to the home page
        Get.back();
      } else {
        // Handle the error
        Get.snackbar('Error', 'Failed to post job. Please try again.');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error: An error occurred: $e');
      Get.snackbar('Error', 'An error occurred: $e'); // Show error message to the user
    }
  }
}
