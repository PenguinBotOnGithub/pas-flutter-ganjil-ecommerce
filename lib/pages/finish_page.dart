import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/finish_controller.dart';
import 'package:flutter_tugas_pas/widgets/components/default_button_custom_color.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/enums.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';

class FinishPage extends GetView<FinishController> {
  const FinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => Scaffold(
          body: Center(
            child: Obx(() => AnimatedSwitcher(
                  duration: kAnimationDurationLong,
                  child: switch (controller.loadState.value) {
                    LoadState.loading => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Processing your payment...",
                            style: mSubErrorTextStyle,
                          )
                        ],
                      ),
                    LoadState.complete => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            size: getProportionateScreenWidth(100),
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Your payment has been successfully processed",
                            style: mSubErrorTextStyle,
                          )
                        ],
                      ),
                    LoadState.error => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: kPrimaryColor,
                            size: getProportionateScreenWidth(100),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Error processing your payment",
                            style: mSubErrorTextStyle,
                          )
                        ],
                      ),
                  },
                )),
          ),
          bottomNavigationBar: controller.loadState.value != LoadState.loading
              ? Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 0.5, color: mGreyColor))),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: getProportionateScreenHeight(80),
                  child: Row(
                    children: [
                      Expanded(
                          child: DefaultButtonCustomColor(
                        text: controller.loadState.value == LoadState.complete
                            ? "Back to Home"
                            : "Back",
                        color: kPrimaryColor,
                        press: controller.onBackTap,
                      ))
                    ],
                  ),
                )
              : null),
    );
  }
}
