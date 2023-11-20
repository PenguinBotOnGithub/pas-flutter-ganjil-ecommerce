import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/product.dart';
import 'package:flutter_tugas_pas/models/user.dart';
import 'package:flutter_tugas_pas/widgets/loading_state.dart';
import 'package:get/get.dart';
import 'package:option_result/result.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var hm = HiveManager();

  final searchController = TextEditingController();
  final searchFocus = FocusNode();
  final navIndex = 0.obs;
  Rx<LoadState> loadState = LoadState.loading.obs;

  Future<Result<List<Product>, Exception>> getProductList() async {
    try {
      http.Response res = await http.get(
          Uri.parse("https://dummyjson.com/products"),
          headers: <String, String>{"Authentication": "Bearer "});
    } catch (e) {}
  }

  void onSearchTap() {
    searchFocus.requestFocus();
  }

  void onSearchTapOutside(PointerDownEvent event) {
    searchFocus.unfocus();
  }

  void onNavTap(int val) {
    navIndex.value = val;
  }

  void onNotifButtonTap() {
    Get.toNamed("/notifications");
  }
}
