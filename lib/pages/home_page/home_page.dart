import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/home_controllers/home_controller.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/chat_fragment.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/feed_fragment/components/icon_btn_with_counter.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/feed_fragment/components/search_field.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/profile_fragment/profile_pages.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/wishlist_fragment.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/feed_fragment/feed_fragment.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getProportionateScreenHeight(65),
        title: SearchField(
          focus: controller.searchFocus,
          onTap: controller.onSearchTap,
          onTapOutside: controller.onSearchTapOutside,
          controller: controller.searchController,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconBtnWithCounter(
              svgSrc: "assets/icons/Cart.svg",
              press: controller.onCartButtonTap,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconBtnWithCounter(
              svgSrc: "assets/icons/Bell.svg",
              numOfitem: 3,
              press: controller.onNotifButtonTap,
            ),
          ),
        ],
      ),
      body: Obx(
        () => AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: [
              FeedFragment(),
              WishlistFragment(),
              ChatFragment(),
              ProfileFragment()
            ][controller.navIndex.value]),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          useLegacyColorScheme: false,
          selectedItemColor: kPrimaryColor,
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
