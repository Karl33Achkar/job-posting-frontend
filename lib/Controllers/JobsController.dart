import 'package:get/get.dart';
import '../Core/Network/DioClient.dart';
import '../Models/Jobs.dart';

class JobsController extends GetxController {
  final jobsList = <Jobs>[].obs;
  final wishlist = <Jobs>[].obs;


  // Search jobs from the backend (Laravel API)
  Future<void> searchJobs(String query) async {
    try {
      jobsList.clear(); // Clear the current jobs list before each search
      if (query.isNotEmpty) {
        final response = await DioClient().getInstance().get("http://x.x.x.x:8000/api/search", queryParameters: {'q': query});
        if (response.statusCode == 200) {
          final jobsData = response.data['data'] as List;
          jobsList.assignAll(jobsData.map((job) => Jobs.fromJson(job)).toList());
        } else {
          print('No jobs found for query: $query');
        }
      }
    } catch (e) {
      print('Failed to search jobs: $e');
    }
  }

  // Check if a job is in the wishlist
  bool isInWishlist(Jobs job) {
    return wishlist.contains(job);
  }

  // Toggle the wishlist status of a job
  void toggleWishlist(Jobs job) {
    if (isInWishlist(job)) {
      wishlist.remove(job);
    } else {
      wishlist.add(job);
    }
  }
}
