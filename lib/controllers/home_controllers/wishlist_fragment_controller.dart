import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/cart_item.dart';
import 'package:flutter_tugas_pas/models/product.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:get/get.dart';

class WishlistFragmentController extends GetxController {
  var hm = HiveManager();
  RxList<Product> products = <Product>[].obs;
  RxInt amount = 1.obs;
  void onAddTap() => amount.value++;
  void onReduceTap() => amount.value > 1 ? amount.value-- : null;

  @override
  void onInit() {
    super.onInit();
    products.value =
        (hm.getDataBox.get(hm.wishlistKey, defaultValue: []) as List<dynamic>)
            .cast();
  }

  void onRemoveTap(int id) async {
    await Get.defaultDialog(
      title: "Confirmation",
      textConfirm: "Yes",
      confirmTextColor: mFillColor,
      onConfirm: () {
        products.removeAt(id);
        hm.getDataBox.put(hm.wishlistKey, products);
        Get.back();
      },
      textCancel: "No",
      middleText: "Do you reall want to remove this item from your wishlist?",
    );
  }

  void onCartAdd(int id, double counterWidth) async {
    await Get.defaultDialog(
        title: "Add To Cart",
        content: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter the amount of items you want to add: "),
              SizedBox(
                height: 20,
              ),
              Container(
                width: counterWidth,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    border: Border.all(color: mGreyColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: onReduceTap,
                      icon: Icon(Icons.remove),
                    ),
                    Text("${amount.value}"),
                    IconButton(onPressed: onAddTap, icon: Icon(Icons.add))
                  ],
                ),
              )
            ],
          ),
        ),
        textCancel: "Cancel",
        onCancel: () => amount.value = 1,
        textConfirm: "Add",
        confirmTextColor: mFillColor,
        onConfirm: () {
          List<CartItem> cart =
              (hm.getDataBox.get(hm.cartKey, defaultValue: []) as List<dynamic>)
                  .cast();
          cart.add(CartItem(product: products[id], amount: amount.value));
          hm.getDataBox.put(hm.cartKey, cart);
          Get.back();
          amount.value = 1;
          Get.rawSnackbar(
              title: "INFORMATION",
              message: "Selected item(s) has been added to cart");
        });
  }
}
