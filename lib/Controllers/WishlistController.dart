import 'package:get/get.dart';
import '../Views/HomePage.dart';


class WishlistController extends GetxController{
  var wishlist = <JobCard>[].obs; // Observable list of JobCards

  void addToWishlist(JobCard job) {
    wishlist.add(job);  // Add a job card to the wishlist
  }

  void removeFromWishlist(JobCard job) {
    wishlist.remove(job);  // Remove a job card from the wishlist
  }

  bool isInWishlist(JobCard job) {
    return wishlist.contains(job);  // Check if the job is in the wishlist
  }
}
