import 'package:flutter/material.dart';
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight40,
              containerWidget(
                height: 250,
                width: double.infinity,
                child: Image.asset(signupImage),
                align: Alignment.center,
                color: whiteColor,
              ),
              sizedBoxHeight20,
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  signUpText,
                  style: style30w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: CustomTextFormField(
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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: CustomTextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Password...";
                    }
                    return null;
                  },
                  controller: passwordSignupController,
                  hintText: "Enter Password",
                  icon: const Icon(Icons.lock),
                ),
              ),
              // sizedBoxHeight20,
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              //   child: CustomTextFormField(
              //     validator: (val) {
              //       if (val!.isEmpty) {
              //         return "Please Enter PhoneNumber";
              //       }
              //       return null;
              //     },
              //     controller: passwordController,
              //     hintText: "Enter Phone",
              //     icon: const Icon(Icons.phone),
              //   ),
              // ),
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
              sizedBoxHeight40,
              customButton(
                  name: signUpText,
                  color: blueColor,
                  onTap: () {
                    getApiForSignup();
                  }),
              sizedBoxHeight40,
              Align(
                alignment: Alignment.center,
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
            ],
          ),
        ],
      ),
    );
  }
}
