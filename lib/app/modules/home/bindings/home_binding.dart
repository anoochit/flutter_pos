import 'package:get/get.dart';
import 'package:winapp/app/modules/order/controllers/order_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<OrderController>(
      () => OrderController(),
    );
  }
}
