import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/cart_item.dart';
import 'package:flutter_tugas_pas/models/product.dart';
import 'package:flutter_tugas_pas/models/user.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/enums.dart';
import 'package:get/get.dart';
import 'package:option_result/option_result.dart';
import 'package:http/http.dart' as http;

class DetailController extends GetxController {
  var hm = HiveManager();

  Rx<LoadState> fetchLoad = LoadState.loading.obs;
  RxInt imageCarouselPage = 0.obs;
  RxList<Product> wishlist = <Product>[].obs;
  RxList<CartItem> cart = <CartItem>[].obs;

  Rx<Product> product = Product.zero().obs;
  RxString error = "".obs;
  RxInt amount = 1.obs;
  var imagePageController = PageController();
  RxString actionButtonText = "".obs;
  RxBool isInWishlist = false.obs;
  RxBool isInCart = false.obs;

  void onAddTap() => amount.value++;
  void onReduceTap() =>
      amount.value > 1 ? amount.value-- : amount.value = amount.value;

  void onWishlistTap() {
    if (fetchLoad.value != LoadState.complete) return;
    if (isInWishlist.value) {
      wishlist.removeWhere((e) => e.id == product.value.id);
      hm.getDataBox.put(hm.wishlistKey, wishlist);
      isInWishlist.value = !isInWishlist.value;
    } else {
      wishlist.add(product.value);
      hm.getDataBox.put(hm.wishlistKey, wishlist);
      isInWishlist.value = !isInWishlist.value;
    }
  }

  void onImageCarouselPageChanged(int val) {
    imageCarouselPage.value = val;
  }

  void onPreviewImageTap(int id) {
    imagePageController.animateToPage(id,
        duration: kAnimationDurationLong, curve: Curves.decelerate);
  }

  @override
  onInit() async {
    super.onInit();
    int id = Get.arguments as int;
    switch (await getProductInfo(id)) {
      case Ok(value: Product p):
        {
          // debugPrint(p.toString());
          product.value = p;
          fetchLoad.value = LoadState.complete;
        }

      case Err(value: String e):
        {
          error.value = e;
          Get.snackbar("ERROR", e);
          fetchLoad.value = LoadState.error;
        }
    }
    wishlist.value = (hm.getDataBox
            .get(hm.wishlistKey, defaultValue: <Product>[]) as List<dynamic>)
        .cast();
    wishlist.forEach(
        (p) => p.id == product.value.id ? isInWishlist.value = true : null);
    cart.value =
        (hm.getDataBox.get(hm.cartKey, defaultValue: []) as List<dynamic>)
            .cast();
    cart.forEach(
        (e) => e.product.id == product.value.id ? isInCart.value = true : null);
    if (isInCart.value) {
      amount.value =
          (cart.firstWhere((e) => e.product.id == product.value.id)).amount;
      actionButtonText.value = "Remove From Cart";
    } else {
      actionButtonText.value = "Add To Cart";
    }
  }

  void onActionButtonTap() {
    if (isInCart.value) {
      int i = 0;
      for (i = 0; i < cart.length; i++) {
        if (cart[i].product.id == product.value.id) {
          break;
        }
      }
      cart.removeAt(i);
      hm.getDataBox.put(hm.cartKey, cart);
      isInCart.value = false;
      amount.value = 1;
      actionButtonText.value = "Add To Cart";
    } else {
      cart.add(CartItem(product: product.value, amount: amount.value));
      hm.getDataBox.put(hm.cartKey, cart);
      isInCart.value = true;
      actionButtonText.value = "Remove From Cart";
    }
    debugPrint(cart.toString());
  }

  Future<Result<Product, String>> getProductInfo(int id) async {
    User user = hm.getDataBox.get(hm.loggedInUserKey);
    try {
      http.Response res = await http.get(
          Uri.parse("https://dummyjson.com/products/$id"),
          headers: <String, String>{
            "Authorization": "Bearer ${user.token}",
            "Content-Type": "application/json"
          });
      // debugPrint(res.body);
      return Ok(Product.fromJson(jsonDecode(res.body)));
    } catch (e) {
      return Err(e.toString());
    }
  }
}
