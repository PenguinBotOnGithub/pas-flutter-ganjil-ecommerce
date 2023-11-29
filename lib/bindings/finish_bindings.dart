import 'package:flutter_tugas_pas/controllers/finish_controller.dart';
import 'package:get/get.dart';

class FinishBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinishController());
  }
}
