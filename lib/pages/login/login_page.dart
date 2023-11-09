import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/login_controller.dart';
import 'package:flutter_tugas_pas/pages/login/components/LoginComponent.dart';
import 'package:flutter_tugas_pas/size_config.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: LoginComponent(),
    );
  }
}
