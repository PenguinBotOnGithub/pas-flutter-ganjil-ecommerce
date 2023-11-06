import 'package:get/get.dart';

class HomeController extends GetxController {
  final navIndex = 0.obs;

  void onNavTap(int val) {
    navIndex.value = val;
  }
}
