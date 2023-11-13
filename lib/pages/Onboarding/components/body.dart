import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/constants.dart';
import 'package:flutter_tugas_pas/size_config.dart';

import 'onboarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> onboardingData = [
    {
      "text": "Welcome to ELECTOKO, let's go shopping!",
      'image': 'assets/images/Onboarding_1'
    },
    {
      "text": "We offer the lower price and good quality",
      'image': 'assets/images/Onboarding_2'
    },
    {
      "text": "Our application are user friendly",
      'image': 'assets/images/Onboarding_3'
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
                itemCount: onboardingData.length,
                  itemBuilder: (context, index) => OnboardingContent(
                      text: onboardingData[index]['text']!,
                      image: onboardingData[index]["image"]!,
                  ),
              ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

