import 'package:flutter/material.dart';

import '../size_config.dart';

class DefaultButtonCustomColor extends StatelessWidget {
  const DefaultButtonCustomColor(
      {Key? key, required this.text, this.color, this.press, this.borderRadius})
      : super(key: key);
  final String text;
  final Color? color;
  final Function? press;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20)),
          backgroundColor: color,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
