import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/pages/login/components/login_component.dart';
import 'package:flutter_tugas_pas/size_config.dart';

class LoginPage extends StatelessWidget {
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
