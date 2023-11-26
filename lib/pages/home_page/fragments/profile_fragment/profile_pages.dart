import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/home_controllers/profile_fragment_controller.dart';
import 'package:get/get.dart';
import 'components/body.dart';

class ProfileFragment extends GetView<ProfileFragmentController> {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Body(
      controller: controller,
    );
  }
}
