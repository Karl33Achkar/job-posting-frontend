import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/PostJobController.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostJobController());
  }
}
