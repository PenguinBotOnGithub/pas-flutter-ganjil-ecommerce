import 'package:flutter/material.dart';
import 'product_card.dart';
import 'package:flutter_tugas_pas/models/product.dart';

import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final List<Product> products;
  final void Function(int) onProductTap;

  const PopularProducts(
      {super.key, required this.products, required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                (index) {
                  // if (demoProducts[index].isPopular)
                  return ProductCard(
                    product: products[index],
                    onProductTap: onProductTap,
                  );

                  /* return SizedBox
                      .shrink(); */ // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
