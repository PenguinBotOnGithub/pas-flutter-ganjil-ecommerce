import 'package:flutter_tugas_pas/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}
