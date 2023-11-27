import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var hm = HiveManager();
  RxList<CartItem> products = <CartItem>[].obs;

  @override
  onInit() {
    super.onInit();
    products.value =
        (hm.getDataBox.get(hm.cartKey, defaultValue: []) as List<dynamic>)
            .cast();
  }
}