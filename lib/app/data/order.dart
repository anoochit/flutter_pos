class OrderItem {
  String productId;
  String title;
  int qt;
  double price;
  double total;
  OrderItem({
    required this.productId,
    required this.title,
    required this.qt,
    required this.price,
    required this.total,
  });
}

class Order {
  String customerId;
  DateTime dateTime;
  List<OrderItem> orderItem;
  double purchese;
  double change;
  double total;
  Order({
    required this.customerId,
    required this.dateTime,
    required this.orderItem,
    required this.purchese,
    required this.change,
    required this.total,
  });
}
