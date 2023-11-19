import 'package:flutter_tugas_pas/controllers/detail_controller.dart';
import 'package:get/get.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
