import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/components/default_button_custom_color.dart';
import 'package:flutter_tugas_pas/constants.dart';
import 'package:flutter_tugas_pas/size_config.dart';

import 'onboarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "text": "Welcome to ELECTOKO, let's go shopping!",
      'image': 'assets/images/Onboarding_1.png'
    },
    {
      "text": "We offer the lower price and good quality",
      'image': 'assets/images/Onboarding_2.png'
    },
    {
      "text": "Our application are user friendly",
      'image': 'assets/images/Onboarding_3.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => OnboardingContent(
                text: onboardingData[index]['text']!,
                image: onboardingData[index]["image"]!,
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
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: kAnimationDuration,
                        margin: EdgeInsets.only(right: 5),
                        height: 6,
                        width: currentPage == index ? 20 : 6,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? kPrimaryColor
                              : mGreyColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(56),
                    child: DefaultButtonCustomeColor(
                      color: kPrimaryColor,
                      text: "Login",
                      press: () {},
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
