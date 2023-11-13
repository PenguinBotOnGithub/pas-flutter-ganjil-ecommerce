import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/components/custom_surfix_icon.dart';
import 'package:flutter_tugas_pas/components/default_button_custom_color.dart';
import 'package:flutter_tugas_pas/constants.dart';
import 'package:flutter_tugas_pas/size_config.dart';
import 'package:flutter_tugas_pas/controllers/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remember = false;

  TextEditingController txtUsername = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildUsername(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPassword(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              Text(
                "Remember me",
                style: TextStyle(
                  color: mGreyColor,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: mGreyColor,
                  ),
                ),
              ),
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Login",
            press: () {},
          ),
          SizedBox(height: 100,),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Don't have an account? Sign Up",
              style: TextStyle(
                color: mGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildUsername() {
    return TextFormField(
      controller: txtUsername,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: "email",
        hintText: "Email or Username",
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50), // Border radius 50
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50), // Border radius 50
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        filled: true,
        fillColor: focusNode.hasFocus ? kPrimaryColor : Colors
            .white, // Ganti warna latar belakang
        contentPadding: EdgeInsets.only(left: 25, right: 25),
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: "password",
        hintText: "Password",
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        filled: true,
        fillColor: focusNode.hasFocus ? kPrimaryColor : Colors.white,
        contentPadding: EdgeInsets.only(left: 25, right: 25),
      ),
    );
  }
}
