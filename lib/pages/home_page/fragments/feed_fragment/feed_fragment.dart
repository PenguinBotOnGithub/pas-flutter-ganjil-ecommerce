import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/home_controllers/feed_fragment_controller.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/feed_fragment/components/body.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/enums.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';

class FeedFragment extends GetView<FeedFragmentController> {
  const FeedFragment({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(() => switch (controller.loadState.value) {
          LoadState.loading => Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          LoadState.complete => Body(
              products: controller.products,
              onProductTap: controller.onProductTap,
            ),
          LoadState.error => Center(
              child: Column(
                children: [
                  Icon(
                    Icons.error,
                    size: getProportionateScreenWidth(80),
                  ),
                  Text("Sorry!, we have an encountered an error")
                ],
              ),
            ),
        });
  }
}
