import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/widgets/components/default_button_custom_color.dart';
import 'package:flutter_tugas_pas/widgets/components/text_fields.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/controllers/login_controller.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20),
            ),
            child: Column(
              children: [
                SimpleShadow(
                  opacity: 0.5,
                  color: kPrimaryColor,
                  offset: const Offset(5, 5),
                  sigma: 2,
                  child: Image.asset(
                    "assets/images/Login.png",
                    height: 186,
                    width: 200,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Form(
                  child: Column(
                    children: [
                      StyledTextField.form(
                          onTap: controller.onTapUsernameFocus,
                          onTapOutside: controller.onTapOutsideUsernameFocus,
                          focusNode: controller.usernameFocus,
                          label: "Username",
                          hint: "Username",
                          svgSuffixIcon: "assets/icons/Mail.svg",
                          controller: controller.usernameController),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      // buildPassword(),
                      StyledTextField.password(
                          onTap: controller.onTapPasswordFocus,
                          onTapOutside: controller.onTapOutsidePasswordFocus,
                          focusNode: controller.passwordFocus,
                          label: "Password",
                          hint: "Password",
                          svgSuffixIcon: "assets/icons/Lock.svg",
                          controller: controller.passwordController),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Row(
                        children: [
                          /*  Obx(
                            () => Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: controller.handleRememberCheck),
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              color: mGreyColor,
                            ),
                          ), */
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: mGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      DefaultButtonCustomColor(
                        color: kPrimaryColor,
                        text: "Login",
                        press: controller.handeLogin,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            color: mGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TextFormField buildPassword() {
  //   return TextFormField(
  //     controller: controller.passwordController,
  //     obscureText: true,
  //     keyboardType: TextInputType.text,
  //     style: mTitleStyle,
  //     decoration: InputDecoration(
  //       labelText: "Password",
  //       hintText: "Password",
  //       labelStyle: TextStyle(
  //         color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
  //       ),
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSuffixIcon(
  //         svgIcon: "assets/icons/Lock.svg",
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(50),
  //         borderSide: BorderSide(
  //           color: kPrimaryColor,
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(50),
  //         borderSide: BorderSide(
  //           color: kPrimaryColor,
  //         ),
  //       ),
  //       filled: true,
  //       fillColor: focusNode.hasFocus ? kPrimaryColor : Colors.white,
  //       contentPadding: EdgeInsets.only(left: 25, right: 25),
  //     ),
  //   );
  // }
}
