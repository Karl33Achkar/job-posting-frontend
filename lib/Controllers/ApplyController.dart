import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_posting_application/Core/Network/DioClient.dart';

class ApplyController extends GetxController {
  // Form field controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  // Rx variables for UI updates
  var isSubmitting = false.obs;
  var selectedResume = Rx<File?>(null);

  // Method to pick a PDF file (resume)
  Future<void> pickResume() async {
    try {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf','doc','docx'],
      );

      if (pickedFile != null && pickedFile.files.single.path != null) {
        selectedResume.value = File(pickedFile.files.single.path!);
      } else {
        Get.snackbar("Error", "No file selected.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick a file: $e");
    }
  }

  // Method to submit the application
  Future<void> submitApplication() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required.");
      return;
    }

    if (selectedResume.value == null) {
      Get.snackbar("Error", "Please upload a resume.");
      return;
    }

    isSubmitting.value = true;

    try {
      // Prepare the form data
      dio.FormData formData = dio.FormData.fromMap({
        'full_name': nameController.text,
        'email': emailController.text,
        'resume_path': await dio.MultipartFile.fromFile(
          selectedResume.value!.path,
          filename: selectedResume.value!.path.split('/').last,
        ),
      });

      // Send the POST request
      final response = await DioClient().getInstance().post('http://192.168.1.112:8000/api/apply', // Replace with your backend URL
        data: formData,
      );

      if (response.statusCode == 201) {
        Get.snackbar("Success", "Application submitted successfully!");
        clearForm();
      } else {
        Get.snackbar("Error", "Failed to submit application. Try again.");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isSubmitting.value = false;
    }
  }

  // Method to clear the form
  void clearForm() {
    nameController.clear();
    emailController.clear();
    selectedResume.value = null;
  }

  @override
  void onClose() {
    // Dispose controllers when the controller is removed
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
