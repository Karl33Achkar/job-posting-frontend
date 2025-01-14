import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/JobsController.dart';
import 'package:job_posting_application/Views/JobsPage.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JobsController());
    final JobsController jobsController = Get.find<JobsController>();

    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define relative sizes
    final titleFontSize = screenWidth * 0.08;
    final jobTextFontSize = screenWidth * 0.045;
    final jobCountFontSize = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Wishlist',
              style: TextStyle(
                fontFamily: 'Noir Pro',
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Obx(() {
              final int jobCount = jobsController.wishlist.length;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Jobs",
                    style: TextStyle(
                      fontSize: jobTextFontSize,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Noir Pro',
                    ),
                  ),
                  Text(
                    "$jobCount ${jobCount == 1 ? 'job' : 'jobs'}",
                    style: TextStyle(
                      fontSize: jobCountFontSize,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Noir Pro',
                    ),
                  ),
                ],
              );
            }),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: Obx(() {
                if (jobsController.wishlist.isEmpty) {
                  return const Center(
                    child: Text(
                      'No jobs in wishlist',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: jobsController.wishlist.length,
                  itemBuilder: (context, index) {
                    final job = jobsController.wishlist[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      child: JobCard(job: job), // Reusing the JobCard widget
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                icon: Image.asset('images/black_likes.png'),
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
