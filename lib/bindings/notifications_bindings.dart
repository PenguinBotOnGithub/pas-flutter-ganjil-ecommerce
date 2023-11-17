import 'package:flutter_tugas_pas/controllers/notifications_controller.dart';
import 'package:get/get.dart';

class NotificationsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsController());
  }
}
