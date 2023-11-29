import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/user.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:get/get.dart';

class ProfileFragmentController extends GetxController {
  var hm = HiveManager();
  RxString userPfp = "".obs;

  @override
  void onInit() {
    super.onInit();
    User user = hm.getDataBox.get(hm.loggedInUserKey);
    userPfp.value = user.image;
  }

  void onLogoutTap() async {
    await Get.defaultDialog(
        title: "Confirmation",
        middleText: "Are you sure you want to log out?",
        textCancel: "No",
        textConfirm: "Yes",
        confirmTextColor: mFillColor,
        onConfirm: () {
          hm.getDataBox.put(hm.loggedInUserKey, null);
          Get.offAllNamed("/login");
        });
  }
}
