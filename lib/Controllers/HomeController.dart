import 'dart:convert';
import 'package:get/get.dart';
import 'package:job_posting_application/Core/Network/DioClient.dart';
import 'package:job_posting_application/Models/Jobs.dart'; // Assuming you have a Job model
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var jobs = <Jobs>[].obs; // Observable list of jobs
  var isLoading = true.obs; // Loading state

  @override
  void onInit() {
    super.onInit();
    loadJobs(); // Load jobs from Shared Preferences on initialization
    fetchJobs(); // Fetch jobs from the API
  }

  void fetchJobs() async {
    try {
      isLoading(true);
      var response = await DioClient().getInstance().get("http://192.x.x.x:8000/api/jobs");
      if (response.statusCode == 200 && response.data != null) {
        var jobsData = response.data['data'] as List;
        jobs.value = jobsData.map((job) => Jobs.fromJson(job)).toList();
        saveJobs(); // Save fetched jobs to Shared Preferences
      } else {
        print("Error: Unexpected response format or empty data.");
      }
    } catch (e) {
      print("Error fetching jobs: $e");
    } finally {
      isLoading(false);
    }
  }

  void addJob(Jobs job) {
    jobs.insert(0, job); // Add the new job to the list
    saveJobs(); // Save the updated job list to Shared Preferences
  }

  Future<void> saveJobs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jobsJson = json.encode(jobs.map((job) => job.toJson()).toList()); // Convert jobs to JSON string
      await prefs.setString('postjobs', jobsJson); // Save JSON string to Shared Preferences
    } catch (e) {
      print('Error saving jobs: $e');
    }
  }

  Future<void> loadJobs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jobsJson = prefs.getString('postjobs'); // Retrieve the jobs JSON string

      if (jobsJson != null) {
        List<dynamic> jobList = json.decode(jobsJson);
        jobs.value = jobList.map((job) => Jobs.fromJson(job)).toList(); // Convert JSON back to Jobs objects
      }
    } catch (e) {
      print('Error loading jobs: $e');
    }
  }
}
