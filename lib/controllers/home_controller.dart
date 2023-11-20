import 'dart:convert';

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
  List<Product> products = <Product>[].obs;

  final searchController = TextEditingController();
  final searchFocus = FocusNode();
  final navIndex = 0.obs;
  Rx<LoadState> loadState = LoadState.loading.obs;

  @override
  onInit() async {
    super.onInit();
    products = switch (await getProductList()) {
      Ok(value: var pl) => pl,
      Err(value: var e) => [],
    };
    loadState.value = LoadState.complete;
  }

  Future<Result<List<Product>, Exception>> getProductList() async {
    User user = hm.getDataBox.get(hm.loggedInUserKey);
    try {
      http.Response res = await http.get(
          Uri.parse("https://dummyjson.com/products"),
          headers: <String, String>{"Authentication": "Bearer ${user.token}"});
      var handledProducts =
          handleJsonList(jsonDecode(res.body) as Map<String, dynamic>);
      return Ok(handledProducts);
    } catch (e) {
      debugPrint(e.toString());
      return Err(e as Exception);
    }
  }

  List<Product> handleJsonList(Map<String, dynamic> json) {
    List<dynamic> rawList = json["products"];
    List<Map<String, dynamic>> mapList =
        rawList.map((e) => e as Map<String, dynamic>).toList();
    List<Product> handledList =
        mapList.map((e) => Product.fromJson(e)).toList();
    debugPrint(handledList.toString());
    return handledList;
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
