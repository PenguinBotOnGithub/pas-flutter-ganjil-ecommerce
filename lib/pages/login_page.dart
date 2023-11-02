import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.usernameController,
              decoration: InputDecoration(
                hintText: "Username",
              ),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            ElevatedButton(
                onPressed: controller.handeLogin, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
