import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/bindings/login_bindings.dart';
import 'package:flutter_tugas_pas/pages/home_page.dart';
import 'package:flutter_tugas_pas/pages/login_page/login_page.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
          )),
      initialRoute: "/login",
      initialBinding: LoginBindings(),
      getPages: [
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/home", page: () => HomePage()),
      ],
    );
  }
}
