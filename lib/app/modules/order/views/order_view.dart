import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winapp/app/data/order.dart';
import 'package:winapp/app/data/sample.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        // product list
        Expanded(
          flex: 1,
          child: Column(
            children: [
              // menu list
              const CategoryList(),
              // product list
              const ProductList(),
            ],
          ),
        ),

        // list card
        const VerticalDivider(
          width: 12.0,
        ),
        GetBuilder<OrderController>(
          builder: (controller) {
            return Container(
              width: 300,
              child: Column(
                children: [
                  // top billing
                  Container(height: 64, child: const Center(child: Text("CUSTOMER 1"))),

                  // list  products
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.listOrder.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(controller.listOrder[index].title),
                          trailing: Text('${controller.listOrder[index].qt}'),
                        );
                      },
                    ),
                  ),

                  // purchase
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "สั่งอาหาร",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    ));
  }
}

class CategoryList extends GetView<OrderController> {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (context) {
      return Container(
        height: 64 + 8,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sampleCategory.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () {
                  controller.currentCategory.value = sampleCategory[index].id;
                  controller.update();
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: Text(
                      sampleCategory[index].title,
                      style: TextStyle(
                        fontWeight: (controller.currentCategory.value == sampleCategory[index].id)
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) {
        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: sampleProducts
                .where((element) => (element.categoryId == controller.currentCategory.value))
                .toList()
                .length,
            itemBuilder: (BuildContext context, int index) {
              final items =
                  sampleProducts.where((element) => (element.categoryId == controller.currentCategory.value)).toList();
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    // add to cart
                    controller.addItem2Cart(product: items[index]);
                  },
                  child: GridTile(
                    footer: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(items[index].title),
                    ),
                    child: Container(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
