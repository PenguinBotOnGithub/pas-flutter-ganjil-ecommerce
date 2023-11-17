import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/bindings/home_bindings.dart';
import 'package:flutter_tugas_pas/bindings/login_bindings.dart';
import 'package:flutter_tugas_pas/bindings/onboarding_bindings.dart';
import 'package:flutter_tugas_pas/pages/login_page.dart';
import 'package:flutter_tugas_pas/pages/onboarding_page.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/bindings/notifications_bindings.dart';
import 'package:flutter_tugas_pas/models/product.dart';
import 'package:flutter_tugas_pas/models/user.dart';
import 'package:flutter_tugas_pas/pages/home_page/home_page.dart';
import 'package:flutter_tugas_pas/pages/notifications_page.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProductAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "SFProDisplay",
          scaffoldBackgroundColor: mBackgroundColor,
          appBarTheme: AppBarTheme(
            color: mBackgroundColor,
            elevation: 0,
          )),
      initialRoute: "/onboarding",
      initialBinding: OnboardingBindings(),
      getPages: [
        GetPage(
            name: "/login", page: () => LoginPage(), binding: LoginBindings()),
        GetPage(name: "/home", page: () => HomePage(), binding: HomeBindings()),
        GetPage(
            name: "/notifications",
            page: () => NotificationsPage(),
            binding: NotificationsBindings()),
        GetPage(
            name: "/onboarding",
            page: () => OnboardingPage(),
            binding: OnboardingBindings()),
      ],
    );
  }
}
