import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var hm = HiveManager();
  RxList<CartItem> products = <CartItem>[].obs;
  RxInt totalPrice = 0.obs;

  @override
  onInit() {
    super.onInit();
    products.value =
        (hm.getDataBox.get(hm.cartKey, defaultValue: []) as List<dynamic>)
            .cast();
    products.forEach((e) => totalPrice.value += e.product.price);
  }

  void onRemoveTap(int index) {
    products.removeAt(index);
    hm.getDataBox.put(hm.cartKey, products);
  }
}
