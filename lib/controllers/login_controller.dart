import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
import 'package:flutter_tugas_pas/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:option_result/option_result.dart';

class LoginController extends GetxController {
  // UI related variables
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();
  final rememberMe = false.obs;

  void onTapUsernameFocus() {
    passwordFocus.unfocus();
    usernameFocus.requestFocus();
  }

  void onTapOutsideUsernameFocus(e) => usernameFocus.unfocus();

  void onTapPasswordFocus() {
    usernameFocus.unfocus();
    passwordFocus.requestFocus();
  }

  void onTapOutsidePasswordFocus(e) => passwordFocus.unfocus();

  void handleRememberCheck(bool? val) {
    rememberMe.value = val!;
  }

  void handeLogin() async {
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Get.closeAllSnackbars();
      Get.rawSnackbar(
          title: "LOGIN ERROR",
          message: "Username and passwords fields can not be empty");
      return;
    }

    var loginResponse = (await sendLoginCredentials()).unwrapOr(
        http.Response("{\"message\": \"No network connection\"}", 600));
    var handledResponse = await handleLoginResponse(loginResponse);

    switch (handledResponse) {
      case Ok(value: User user):
        {
          debugPrint("todo: Implement persistent login");
          debugPrint(user.toString());
          Get.closeAllSnackbars();
          /* todo: FIX bug where logging in without rememberMe = true
             causes null user returned when retrieving user from Hive */
          if (rememberMe.value) {
            var hm = HiveManager();
            hm.getDataBox.put(hm.loggedInUserKey, user);
          }
          Get.offNamed("/home");
        }
      case Err(value: String errorMsg):
        {
          Get.closeAllSnackbars();
          Get.rawSnackbar(title: "LOGIN ERROR", message: errorMsg);
        }
    }
  }

  Future<Result<http.Response, Exception>> sendLoginCredentials() async {
    try {
      var res = await http.post(Uri.parse("https://dummyjson.com/auth/login"),
          headers: <String, String>{"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{
            "username": usernameController.text,
            "password": passwordController.text
          }));
      return Ok(res);
    } catch (e) {
      debugPrint(e.toString());
      return Err(e as Exception);
    }
  }

  Future<Result<User, String>> handleLoginResponse(http.Response res) async {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      Map<String, dynamic> body = jsonDecode(res.body) as Map<String, dynamic>;
      User user = User.fromJson(body);
      return Ok(user);
    } else {
      Map<String, dynamic> body = jsonDecode(res.body) as Map<String, dynamic>;
      return Err(
          "${res.statusCode}: ${(body['message'] as String?) ?? 'null'}");
    }
  }
}
