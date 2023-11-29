import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/onboarding_controller.dart';
import 'package:flutter_tugas_pas/widgets/components/default_button_custom_color.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  Widget onboardingContent({required String text, required String image}) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "ELECTOKO",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingData.length,
                itemBuilder: (context, index) => onboardingContent(
                  text: controller.onboardingData[index]['text']!,
                  image: controller.onboardingData[index]["image"]!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.onboardingData.length,
                        (index) => Obx(() => AnimatedContainer(
                              duration: kAnimationDuration,
                              margin: const EdgeInsets.only(right: 5),
                              height: 6,
                              width: controller.currentPage.value == index
                                  ? 20
                                  : 6,
                              decoration: BoxDecoration(
                                color: controller.currentPage.value == index
                                    ? kPrimaryColor
                                    : mGreyColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            )),
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                      child: DefaultButtonCustomColor(
                        color: kPrimaryColor,
                        text: "Login",
                        press: controller.onLoginTap,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
