import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/bindings/home_bindings.dart';
import 'package:flutter_tugas_pas/bindings/login_bindings.dart';
import 'package:flutter_tugas_pas/bindings/onboarding_bindings.dart';
import 'package:flutter_tugas_pas/helpers/hive_manager.dart';
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
  await HiveManager.init();
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
      initialRoute: "/splash",
      getPages: [
        GetPage(
            name: "/splash",
            page: () => FlutterSplashScreen.fadeIn(
                  onEnd: () {
                    var hm = HiveManager();
                    User? user = hm.getDataBox.get(hm.loggedInUserKey);
                    bool showOnboarding = hm.getSettingsBox
                        .get(hm.onboardingKey, defaultValue: true);
                    if (user != null) {
                      Get.offNamed("/home");
                    } else if (showOnboarding) {
                      Get.offNamed("/onboarding");
                    } else {
                      Get.offNamed("/login");
                    }
                  },
                  backgroundColor: mBackgroundColor,
                  childWidget: Text(
                    "ELECTOKO",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
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
