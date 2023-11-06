import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/home_controller.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/account_fragment.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/cart_fragment.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/favourite_fragment.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/home_fragment.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller.searchController,
          focusNode: controller.searchFocus,
          onTap: controller.onSearchTap,
          onTapOutside: controller.onSearchTapOutside,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Obx(
        () => AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: [
              HomeFragment(),
              CartFragment(),
              FavouriteFragment(),
              AccountFragment()
            ][controller.navIndex.value]),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          useLegacyColorScheme: false,
          currentIndex: controller.navIndex.value,
          onTap: controller.onNavTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
          ],
        ),
      ),
    );
  }
}
