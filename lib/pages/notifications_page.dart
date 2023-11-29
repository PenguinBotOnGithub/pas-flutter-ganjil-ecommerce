import 'package:flutter_tugas_pas/controllers/notifications_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends GetView<NotificationsController> {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: const Center(
        child: Icon(Icons.notifications),
      ),
    );
  }
}
