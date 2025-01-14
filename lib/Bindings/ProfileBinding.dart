import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/ProfileController.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProfileController());
  }

}