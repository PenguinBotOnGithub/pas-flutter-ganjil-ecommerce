import 'package:flutter_tugas_pas/controllers/home_controllers/feed_fragment_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final navIndex = 0.obs;

  // Fragment controllers
  var feedController =
      Get.put<FeedFragmentController>(FeedFragmentController());

  void onNavTap(int val) {
    navIndex.value = val;
  }

  void onNotifButtonTap() {
    Get.toNamed("/notifications");
  }
}
