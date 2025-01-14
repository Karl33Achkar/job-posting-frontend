import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/JobsController.dart';
import 'package:job_posting_application/Views/WishlistPage.dart';

import 'HomePage.dart';
import 'ProfilePage.dart';


class JobsPage extends GetView<JobsController> {
  JobsPage({super.key});

  // Create a TextEditingController to capture search input
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.05;
    const double inputHeight = 50.0;

    Get.put(JobsController());
    final JobsController jobsController = Get.find<JobsController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 45.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jobs',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Noir Pro',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: inputHeight,
                    child: TextField(
                      controller: searchController, // Bind the controller to the TextField
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 3.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Search for a job...',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: inputHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      String searchQuery = searchController.text.trim(); // Get the search query from the TextField
                      if (searchQuery.isNotEmpty) {
                        jobsController.searchJobs(searchQuery); // Trigger the search in the controller
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 17, fontFamily: 'Noir Pro'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (jobsController.jobsList.isEmpty) {
                  return const Center(child: Text('No jobs found for your search.'));
                } else {
                  return ListView.builder(
                    itemCount: jobsController.jobsList.length,
                    itemBuilder: (context, index) {
                      final job = jobsController.jobsList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: JobCard(job: job),
                      );
                    },
                  );
                }
              }),
            ),
          ],
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
                  if (Get.currentRoute != '/JobsPage') {
                    Get.to(() => JobsPage());
                  }
                },
                icon: Image.asset('images/black_jobs.png'),
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
                icon: Image.asset('images/account.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}