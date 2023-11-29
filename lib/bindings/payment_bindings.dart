import 'package:flutter_tugas_pas/controllers/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
