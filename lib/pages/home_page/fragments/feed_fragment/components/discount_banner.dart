import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFCE048C), Color(0xFF4D0A8E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 125,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/Banner.png',
              width: getProportionateScreenWidth(175),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ELEC\nTOKO",
                style: TextStyle(
                  color: kFourthColor,
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.w800,
                  height: 0.9,
                ),
              ),
              Text(
                "40% Discount",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "in any technology purchase",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(12),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
