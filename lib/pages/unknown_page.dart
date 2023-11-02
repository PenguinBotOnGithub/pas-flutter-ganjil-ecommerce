import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Unknown Route"),
            ElevatedButton(
                onPressed: () => Get.toNamed("/home"),
                child: Text("Back to home")),
          ],
        ),
      ),
    );
  }
}
