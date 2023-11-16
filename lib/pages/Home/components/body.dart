import 'package:flutter/material.dart';

import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'discount_banner.dart';
import 'header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            DiscountBanner(),
          ],
        ),
      ),
    );
  }
}