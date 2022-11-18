class Product {
  String id;
  String title;
  String image;
  String categoryId;
  double price;
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.categoryId,
    required this.price,
  });
}

class Category {
  String id;
  String title;
  Category({
    required this.id,
    required this.title,
  });
}
