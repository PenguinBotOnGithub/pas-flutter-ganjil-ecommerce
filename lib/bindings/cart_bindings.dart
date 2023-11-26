import 'package:flutter_tugas_pas/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
