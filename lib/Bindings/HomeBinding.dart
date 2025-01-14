import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/HomeController.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }

}