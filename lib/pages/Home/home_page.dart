import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/home_controller.dart';
import 'package:flutter_tugas_pas/pages/Onboarding/components/body.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';

import '../../widgets/components/navigation_bar.dart';
import '../../widgets/enums.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
