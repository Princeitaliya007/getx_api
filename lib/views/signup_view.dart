import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/apis/signup_api.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_classes.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_functios.dart';
import 'package:getx_api/utils/statics/assets.dart';
import 'package:getx_api/utils/statics/colors.dart';
import 'package:getx_api/utils/statics/sizedbox.dart';
import 'package:getx_api/utils/statics/static_variables.dart';
import 'package:getx_api/utils/statics/textstyles.dart';

import '../utils/statics/strings.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Form(
            key: signupKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxHeight20,
                containerWidget(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(signupImage),
                  align: Alignment.center,
                  color: whiteColor,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    signUpText,
                    style: style30w600,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: CustomTextFormField(
                        obscuretext: false,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Name...";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {});
                        },
                        controller: nameSignupController,
                        hintText: "Enter Name",
                        icon: const Icon(Icons.account_circle_outlined),
                      ),
                    ),
                    sizedBoxHeight20,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: CustomTextFormField(
                        obscuretext: false,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Email...";
                          }
                          return null;
                        },
                        controller: emailSignupController,
                        hintText: "Enter Email",
                        icon: const Icon(Icons.mail),
                      ),
                    ),
                    sizedBoxHeight20,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: CustomTextFormField(
                        obscuretext: false,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter PhoneNumber";
                          }
                          return null;
                        },
                        controller: phoneSignupController,
                        hintText: "Enter Phone",
                        icon: const Icon(Icons.phone),
                      ),
                    ),
                    sizedBoxHeight20,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: CustomTextFormField(
                        obscuretext: false,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter password";
                          }
                          return null;
                        },
                        controller: passwordSignupController,
                        hintText: "Enter Password",
                        icon: const Icon(Icons.key),
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight40,
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: const TextSpan(
                      text: "By signing up, you're agree to our ",
                      style: TextStyle(color: blackColor),
                      children: [
                        TextSpan(
                          text: "Terms and Conditions\n",
                          style: TextStyle(
                            color: blueColor,
                          ),
                        ),
                        TextSpan(
                          text: "and ",
                          style: TextStyle(color: blackColor),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(color: blueColor),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight20,
                Align(
                  child: customButton(
                      name: signUpText,
                      color: blueColor,
                      onTap: () {
                        if (signupKey.currentState!.validate()) {
                          signupKey.currentState!.save();
                          apiForSignUp();
                        }
                      }),
                ),
                sizedBoxHeight20,
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/');
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Joined us before? ",
                        style: TextStyle(color: blackColor),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(color: blueColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
