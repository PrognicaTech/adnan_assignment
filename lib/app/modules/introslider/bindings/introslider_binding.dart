import 'package:get/get.dart';

import '../controllers/introslider_controller.dart';

class IntrosliderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntrosliderController>(
      () => IntrosliderController(),
    );
  }
}
