import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/user.dart';
import 'package:get/get.dart';

class ProfileFragmentController extends GetxController {
  var hm = HiveManager();
  late RxString userPfp = RxString("");

  @override
  void onInit() {
    super.onInit();
    User user = hm.getDataBox.get(hm.loggedInUserKey);
    userPfp.value = user.image;
  }

  void onLogoutTap() {
    hm.getDataBox.put(hm.loggedInUserKey, null);
    Get.offNamed("/login");
  }
}
