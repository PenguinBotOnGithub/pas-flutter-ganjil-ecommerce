import 'package:hive_flutter/hive_flutter.dart';

part 'product.g.dart';

@HiveType(typeId: 2)
class Product {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  int price;
  @HiveField(4)
  double discountPercentage;
  @HiveField(5)
  double rating;
  @HiveField(6)
  int stock;
  @HiveField(7)
  String brand;
  @HiveField(8)
  String category;
  @HiveField(9)
  String thumbnail;
  @HiveField(10)
  List<String> images;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"] as int,
        title: json["title"] as String,
        description: json["description"] as String,
        price: json["price"] as int,
        discountPercentage: json["discountPercentage"] as double,
        rating: json["rating"] as double,
        stock: json["stock"] as int,
        brand: json["brand"] as String,
        category: json["category"] as String,
        thumbnail: json["thumbnail"] as String,
        images:
            (json["images"] as List<dynamic>).map((e) => e as String).toList());
  }

  @override
  String toString() {
    return """
    "id": $id,
    "title": $title,
    "description": $description,
    "price": $price,
    "discountPercentage": $discountPercentage,
    "rating": $rating,
    "stock": $stock,
    "brand": $brand,
    "category": $category,
    "thumbnail": $thumbnail,
    "images": $images
    """;
  }
}

/* List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/Stik_ps4",
    ],
    colors: [
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
];

const String description = "Wireless Controller for PS4";
 */