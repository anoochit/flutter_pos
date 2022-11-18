import 'package:get/get.dart';
import 'package:winapp/app/data/order.dart';
import 'package:winapp/app/data/product.dart';

class OrderController extends GetxController {
  RxString currentCategory = "1".obs;

  RxList<OrderItem> listOrder = <OrderItem>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addItem2Cart({required Product product}) {
    // add to cart
    OrderItem? orderExist = listOrder.firstWhereOrNull((element) => (element.productId == product.id));

    if (orderExist != null) {
      orderExist.qt = orderExist.qt + 1;
      orderExist.total = orderExist.price * orderExist.qt;
    } else {
      listOrder.add(
        OrderItem(
          productId: product.id,
          title: product.title,
          qt: 1,
          price: product.price,
          total: (product.price) * 1,
        ),
      );
    }

    update();
  }
}
