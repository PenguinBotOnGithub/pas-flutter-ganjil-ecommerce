import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  final searchFocus = FocusNode();
  final navIndex = 0.obs;

  void onSearchTap() {
    searchFocus.requestFocus();
  }

  void onSearchTapOutside(PointerDownEvent event) {
    searchFocus.unfocus();
  }

  void onNavTap(int val) {
    navIndex.value = val;
  }
}
