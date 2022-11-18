import 'package:get/get.dart';

import '../controllers/menu_promotion_controller.dart';

class MenuPromotionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuPromotionController>(
      () => MenuPromotionController(),
    );
  }
}
