import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/cart_item.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
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
    calculateTotal();
  }

  void onCheckoutTap() {
    if (products.isEmpty) {
      Get.rawSnackbar(title: "ERROR", message: "No item(s) to process payment");
      return;
    }

    Get.toNamed("/payment", arguments: totalPrice.value);
  }

  void calculateTotal() {
    totalPrice.value = 0;
    for (var e in products) {
      totalPrice.value += e.product.price * e.amount;
    }
  }

  void onRemoveTap(int index) {
    Get.defaultDialog(
        title: "Confirmation",
        middleText: "Do you really want to remove this item(s) from your cart?",
        textCancel: "No",
        textConfirm: "Yes",
        confirmTextColor: mFillColor,
        onConfirm: () {
          products.removeAt(index);
          hm.getDataBox.put(hm.cartKey, products);
          calculateTotal();
          Get.back();
          Get.rawSnackbar(
              title: "INFORMATION",
              message: "The selected item(s) have been removed from your cart");
        });
  }
}
