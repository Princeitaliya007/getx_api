import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  // final user = GetStorage();

  @override
  void initState() {
    super.initState();
    log("message check tokan data -> ${GetStorage().read('logintoken')}");
    log("message check email data -> ${GetStorage().read('loginemail')}");
    log("message store data -> ${GetStorage().read('logintoken') == null && GetStorage().read('loginemail') == null}");
    if (GetStorage().read('logintoken') == null &&
        GetStorage().read('loginemail') == null) {
      log("in if state");
      Get.toNamed('/');
    } else {
      log("in else state");
      Get.offAllNamed('/propertyView');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Form(
              key: loginKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: CustomTextFormField(
                      obscuretext: false,
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
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: CustomTextFormField(
                      obscuretext: false,
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
                ],
              ),
            ),
            sizedBoxHeight20,
            GestureDetector(
              onTap: () {
                Get.toNamed('/forgotpassView');
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 250),
                child: Text(
                  forgotPass,
                  style: TextStyle(color: blueColor),
                ),
              ),
            ),
            sizedBoxHeight40,
            customButton(
                name: loginText,
                color: blueColor,
                onTap: () {
                  if (loginKey.currentState!.validate()) {
                    loginKey.currentState!.save();
                    getApiForLogin();
                  }
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
            InkWell(
              onTap: () {
                Get.offNamedUntil(
                  '/signup',
                  (route) => false,
                );
              },
              child: Align(
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
            ),
          ],
        ),
      ),
    );
  }
}
