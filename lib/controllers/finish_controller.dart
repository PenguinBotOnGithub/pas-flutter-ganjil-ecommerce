import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/cart_item.dart';
import 'package:flutter_tugas_pas/widgets/enums.dart';
import 'package:get/get.dart';

class FinishController extends GetxController {
  var hm = HiveManager();
  Rx<LoadState> loadState = LoadState.loading.obs;

  @override
  void onInit() {
    super.onInit();
    changeLoadStateAfterSeconds(3000);
  }

  Future<void> changeLoadStateAfterSeconds(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    int rnd = Random().nextInt(10);
    if (rnd % 2 == 0) {
      loadState.value = LoadState.complete;
    } else {
      loadState.value = LoadState.error;
    }
  }

  void onBackTap() {
    switch (loadState.value) {
      case LoadState.loading:
        {
          debugPrint("ERROR: Impossible value while in this state");
        }
      case LoadState.complete:
        {
          hm.getDataBox.put(hm.cartKey, <CartItem>[]);
          Get.offAllNamed("/home");
          Get.rawSnackbar(title: "INFORMATION", message: "Payment successful");
        }
      case LoadState.error:
        {
          Get.back();
          Get.rawSnackbar(
              title: "INFORMATION",
              message: "Payment unsuccessful, please try again later");
        }
    }
  }
}
