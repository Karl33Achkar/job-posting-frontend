import 'package:get/get.dart';
import 'package:job_posting_application/Controllers/ApplyController.dart';

class ApplyBinding  extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ApplyController());
  }
}
