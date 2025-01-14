import 'package:get/get.dart';

import '../Controllers/JobsController.dart';


class JobPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => JobsController());
  }
}