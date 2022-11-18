import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menu_promotion_controller.dart';

class MenuPromotionView extends GetView<MenuPromotionController> {
  const MenuPromotionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'MenuPromotionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
