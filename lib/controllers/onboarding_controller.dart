import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;
  List<Map<String, String>> onboardingData = [
    {
      "text": "Welcome to ELECTOKO, let's go shopping!",
      'image': 'assets/images/Onboarding_1.png'
    },
    {
      "text": "We offer the best price and the best quality",
      'image': 'assets/images/Onboarding_2.png'
    },
    {
      "text": "Our application are user friendly",
      'image': 'assets/images/Onboarding_3.png'
    },
  ];

  void onLoginTap() {
    Get.offNamed("/login");
  }

  void onPageChanged(int val) {
    currentPage.value = val;
  }
}
