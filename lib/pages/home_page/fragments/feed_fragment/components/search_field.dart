import 'package:flutter/material.dart';

import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';

class SearchField extends StatelessWidget {
  final FocusNode focus;
  final void Function() onTap;
  final void Function(PointerDownEvent) onTapOutside;
  final TextEditingController controller;

  const SearchField(
      {Key? key,
      required this.focus,
      required this.onTap,
      required this.onTapOutside,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: mGreyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: const TextStyle(color: mGreyColor),
        onTap: onTap,
        onTapOutside: onTapOutside,
        focusNode: focus,
        cursorColor: kPrimaryColor,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(17)),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIconColor: mGreyColor,
            hintText: "Search product",
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}
