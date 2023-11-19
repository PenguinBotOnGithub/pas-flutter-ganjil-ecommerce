import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/pages/Home/components/categories.dart';
import 'package:flutter_tugas_pas/pages/Home/components/popular_product.dart';
import 'package:flutter_tugas_pas/pages/Home/components/special_offers.dart';

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
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30))
          ],
        ),
      ),
    );
  }
}