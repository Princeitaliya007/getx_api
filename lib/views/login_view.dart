import 'package:flutter/material.dart';
import '../apis/login_api.dart';
import '../utils/custom_widgets/custom_widgets_classes.dart';
import '../utils/custom_widgets/custom_widgets_functios.dart';
import '../utils/statics/assets.dart';
import '../utils/statics/colors.dart';
import '../utils/statics/sizedbox.dart';
import '../utils/statics/static_variables.dart';
import '../utils/statics/strings.dart';
import '../utils/statics/textstyles.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxHeight40,
          containerWidget(
            height: 250,
            width: double.infinity,
            child: Image.asset(loginImage),
            align: Alignment.center,
            color: whiteColor,
          ),
          sizedBoxHeight20,
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              loginText,
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
              controller: emailLoginController,
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
              controller: passwordLoginController,
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
          sizedBoxHeight20,
          const Padding(
            padding: EdgeInsets.only(left: 250),
            child: Text(
              forgotPass,
              style: TextStyle(color: blueColor),
            ),
          ),
          sizedBoxHeight40,
          customButton(
              name: loginText,
              color: blueColor,
              onTap: () {
                getApiForLogin();
              }),
          sizedBoxHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              containerWidget(
                height: 2,
                width: 130,
                color: greyColor.withOpacity(0.3),
              ),
              sizedBoxWidth30,
              const Text(orText),
              sizedBoxWidth30,
              containerWidget(
                height: 2,
                width: 130,
                color: greyColor.withOpacity(0.3),
              ),
            ],
          ),
          sizedBoxHeight20,
          customButtonWhite(
              name: loginWithGoogle, color: greyColor.withOpacity(0.3)),
          sizedBoxHeight20,
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: const TextSpan(
                text: "New to Logistics? ",
                style: TextStyle(color: blackColor),
                children: [
                  TextSpan(
                    text: "Register",
                    style: TextStyle(color: blueColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
