import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/pages/Onboarding/components/body.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
