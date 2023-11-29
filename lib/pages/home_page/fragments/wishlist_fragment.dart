import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/home_controllers/wishlist_fragment_controller.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';

class WishlistFragment extends GetView<WishlistFragmentController> {
  const WishlistFragment({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => controller.products.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.heart_broken,
                    color: kPrimaryColor,
                    size: getProportionateScreenWidth(100),
                  ),
                  Text(
                    "Your wishlist is empty",
                    style: mErrorTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Find your dream products and add it here!",
                    style: mSubErrorTextStyle,
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, count) => ListTile(
                    leading: SizedBox(
                        width: getProportionateScreenWidth(80),
                        child: Image.network(
                          controller.products[count].thumbnail,
                          fit: BoxFit.cover,
                        )),
                    title: Text(controller.products[count].title),
                    subtitle:
                        Text("Price: \$${controller.products[count].price}"),
                    trailing: SizedBox(
                      width: getProportionateScreenWidth(90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () => controller.onCartAdd(
                                  count, getProportionateScreenWidth(105)),
                              icon: const Icon(Icons.add_shopping_cart)),
                          IconButton(
                              onPressed: () => controller.onRemoveTap(count),
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  )),
    );
  }
}
