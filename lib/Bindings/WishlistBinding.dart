import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/WishlistController.dart';

class WishlistBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => WishlistController());
  }
}
