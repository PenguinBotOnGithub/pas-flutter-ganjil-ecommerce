import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';

class ChatFragment extends StatelessWidget {
  const ChatFragment({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_off,
            color: kPrimaryColor,
            size: getProportionateScreenWidth(100),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "No friends?",
            style: mErrorTextStyle,
          )
        ],
      ),
    );
  }
}
