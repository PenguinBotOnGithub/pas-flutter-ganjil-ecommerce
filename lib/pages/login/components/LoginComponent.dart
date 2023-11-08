import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/constants.dart';
import 'package:flutter_tugas_pas/pages/login/components/LoginForm.dart';
import 'package:flutter_tugas_pas/size_config.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.4,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.4,
                  ),
                  SimpleShadow(
                    child: Image.asset(
                      "assets/images/Login.png",
                      height: 186,
                      width: 200,
                    ),
                    opacity: 0.5,
                    color: kPrimaryColor,
                    offset: Offset(5, 5),
                    sigma: 2,
                  ),
                  SizedBox(height: 20),
                  Padding(
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
                  SizedBox(height: 34,),
                  LoginForm(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
