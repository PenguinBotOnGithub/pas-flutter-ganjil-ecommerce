import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/home_controllers/feed_fragment_controller.dart';
import 'package:flutter_tugas_pas/controllers/home_controllers/profile_fragment_controller.dart';
import 'package:flutter_tugas_pas/controllers/home_controllers/wishlist_fragment_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final navIndex = 0.obs;
  final searchController = TextEditingController();
  final searchFocus = FocusNode();

  // Fragment controllers
  var feedController =
      Get.put<FeedFragmentController>(FeedFragmentController());
  var profileController =
      Get.put<ProfileFragmentController>(ProfileFragmentController());
  var wishlistControlelr =
      Get.put<WishlistFragmentController>(WishlistFragmentController());

  void onNavTap(int val) {
    navIndex.value = val;
  }

  void onCartButtonTap() {
    Get.toNamed("/cart");
  }

  void onNotifButtonTap() {
    Get.toNamed("/notifications");
  }

  void onSearchTap() {
    searchFocus.requestFocus();
  }

  void onSearchTapOutside(PointerDownEvent event) {
    searchFocus.unfocus();
  }
}
