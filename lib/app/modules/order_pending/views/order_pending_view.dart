import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_pending_controller.dart';

class OrderPendingView extends GetView<OrderPendingController> {
  const OrderPendingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'OrderPendingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
