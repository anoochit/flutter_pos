import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/inventory_controller.dart';

class InventoryView extends GetView<InventoryController> {
  const InventoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'InventoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
