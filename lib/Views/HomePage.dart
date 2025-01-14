import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/HomeController.dart';
import 'package:job_posting_application/Views/PostJob.dart';
import '../Controllers/JobsController.dart';
import '../Models/Jobs.dart';
import 'ApplyPage.dart';
import 'JobsPage.dart';
import 'ProfilePage.dart';
import 'WishlistPage.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Using MediaQuery for responsive padding
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.05;

    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 45.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row to place "Home" title and "Post a Job" button together
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Noir Pro',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Functionality for posting a job (navigate or perform an action)
                    Get.to(() => const PostJob());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Post a Job',
                      style: TextStyle(
                        color: Colors.white, // White text color
                        fontSize: 16,
                        fontFamily: 'Noir Pro',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Jobs list or loading indicator
            Expanded(
              child: Obx(() {
                if (homeController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (homeController.jobs.isEmpty) {
                  return const Center(child: Text('No jobs available'));
                } else {
                  return ListView.builder(
                    itemCount: homeController.jobs.length,
                    itemBuilder: (context, index) {
                      var job = homeController.jobs[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0), // Add bottom padding for gap
                        child: JobCard(job: job), // Pass the job data to JobCard
                      ); // Pass the job data to JobCard
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
      // Bottom navigation bar
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
                icon: Image.asset('images/black_home.png'),
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
                icon: Image.asset('images/account.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Jobs job; // Job details

  JobCard({super.key, required this.job}); // Accepting job data

  // List of random logos or icons (you can also use AssetImage for custom logos)
  final List<IconData> randomIcons = [
    FontAwesomeIcons.linkedin
  ];

  // Function to get a random logo
  IconData getRandomIcon() {
    final random = Random();
    return randomIcons[random.nextInt(randomIcons.length)];
  }

  @override
  Widget build(BuildContext context) {
    final JobsController jobsController = Get.put(JobsController());

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Company logo or random icon
                SizedBox(
                  width: 30,
                  height: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      color: Colors.black,
                      child: Icon(
                        getRandomIcon(), // Use a random icon from the list
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Company name and location
                      Text(
                        '${job.companyName}, ${job.countryName}',
                        style: const TextStyle(fontSize: 20, fontFamily: 'Noir Pro'),
                      ),
                      // Job position
                      Text(
                        '${job.jobName}', // Dynamic job title
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Noir Pro',
                        ),
                      ),
                    ],
                  ),
                ),
                // Heart icon to toggle wishlist status
                Obx(() {
                  bool isFavorite = jobsController.isInWishlist(job);
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      jobsController.toggleWishlist(job);
                    },
                  );
                }),
              ],
            ),
            const SizedBox(height: 20),
            // Job salary
            Text(
              '\$${job.salary} / year',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Noir Pro',
              ),
            ),
            const SizedBox(height: 10),
            // Apply button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const ApplyPage());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(fontSize: 18, fontFamily: 'Noir Pro'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
