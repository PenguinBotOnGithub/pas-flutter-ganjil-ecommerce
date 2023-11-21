import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
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

  Rx<Product> product = Product.zero().obs;
  RxString error = "".obs;
  RxInt amount = 1.obs;
  var imagePageController = PageController();

  void onAddTap() => amount.value++;
  void onReduceTap() =>
      amount.value > 1 ? amount.value-- : amount.value = amount.value;

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
          debugPrint(p.toString());
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
      debugPrint(res.body);
      return Ok(Product.fromJson(jsonDecode(res.body)));
    } catch (e) {
      return Err(e.toString());
    }
  }
}
