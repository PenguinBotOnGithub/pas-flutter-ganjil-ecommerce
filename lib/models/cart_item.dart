import 'package:flutter_tugas_pas/models/product.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 3)
class CartItem {
  @HiveField(0)
  Product product;
  @HiveField(1)
  int amount;

  CartItem({required this.product, required this.amount});
}
