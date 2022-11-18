import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winapp/app/data/menu.dart';
import 'package:winapp/app/modules/inventory/views/inventory_view.dart';
import 'package:winapp/app/modules/menu_promotion/views/menu_promotion_view.dart';
import 'package:winapp/app/modules/order/views/order_view.dart';
import 'package:winapp/app/modules/order_pending/views/order_pending_view.dart';
import 'package:winapp/app/modules/report/views/report_view.dart';
import 'package:winapp/app/modules/settings/views/settings_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: Row(
            children: [
              // side menu
              SideMenu(),

              // body
              Expanded(
                child: IndexedStack(
                  index: controller.navIndex.value,
                  children: const [
                    OrderView(),
                    OrderPendingView(),
                    InventoryView(),
                    MenuPromotionView(),
                    ReportView(),
                    SettingsView(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SideMenu extends GetView<HomeController> {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      width: 180,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: FlutterLogo(size: 120),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    menuItems[index].title,
                    style: TextStyle(
                      fontWeight: (controller.navIndex.value == index) ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    // goto that view
                    controller.navIndex.value = index;
                    controller.update();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
