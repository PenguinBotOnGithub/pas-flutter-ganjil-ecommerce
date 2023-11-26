import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/home_controllers/home_controller.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/account_fragment.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/chat_fragment.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/wishlist_fragment.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/feed_fragment/feed_fragment.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        /* title: TextField(
          controller: controller.searchController,
          focusNode: controller.searchFocus,
          onTap: controller.onSearchTap,
          onTapOutside: controller.onSearchTapOutside,
        ), */
        actions: [
          IconButton(
              onPressed: controller.onNotifButtonTap,
              icon: Icon(Icons.notifications))
        ],
      ), */
      body: Obx(
        () => AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: [
              FeedFragment(),
              WishlistFragment(),
              ChatFragment(),
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
                icon: Icon(Icons.favorite), label: "Wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
          ],
        ),
      ),
    );
  }
}
