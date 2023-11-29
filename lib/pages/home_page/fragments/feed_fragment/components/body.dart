import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/models/product.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/feed_fragment/components/categories.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/feed_fragment/components/popular_product.dart';
import 'package:flutter_tugas_pas/pages/home_page/fragments/feed_fragment/components/special_offers.dart';

import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'discount_banner.dart';

class Body extends StatelessWidget {
  final List<Product> products;
  final void Function(int) onProductTap;

  const Body({super.key, required this.products, required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: getProportionateScreenHeight(20)),
            // HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const DiscountBanner(),
            const Categories(),
            const SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(
              products: products,
              onProductTap: onProductTap,
            ),
            SizedBox(height: getProportionateScreenWidth(30))
          ],
        ),
      ),
    );
  }
}
