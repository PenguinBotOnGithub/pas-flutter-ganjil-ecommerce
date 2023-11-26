import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/product.dart';
import 'package:flutter_tugas_pas/models/user.dart';
import 'package:flutter_tugas_pas/widgets/enums.dart';
import 'package:get/get.dart';
import 'package:option_result/option_result.dart';
import 'package:http/http.dart' as http;

class FeedFragmentController extends GetxController {
  var hm = HiveManager();
  List<Product> products = <Product>[].obs;

  final searchController = TextEditingController();
  final searchFocus = FocusNode();
  Rx<LoadState> loadState = LoadState.loading.obs;

  @override
  onInit() async {
    super.onInit();
    products = switch (await getProductList()) {
      Ok(value: var pl) => pl,
      Err(value: var e) => handleFetchError(e),
    };
    loadState.value = LoadState.complete;
  }

  void onProductTap(int id) {
    Get.toNamed("/detail", arguments: id);
  }

  List<Product> handleFetchError(Exception e) {
    Get.snackbar("ERROR", e.toString());
    return [];
  }

  Future<Result<List<Product>, Exception>> getProductList() async {
    User user = hm.getDataBox.get(hm.loggedInUserKey);
    try {
      http.Response res = await http.get(
          Uri.parse("https://dummyjson.com/products/?limit=10"),
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
}
