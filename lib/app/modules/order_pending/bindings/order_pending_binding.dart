import 'package:get/get.dart';

import '../controllers/order_pending_controller.dart';

class OrderPendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderPendingController>(
      () => OrderPendingController(),
    );
  }
}
