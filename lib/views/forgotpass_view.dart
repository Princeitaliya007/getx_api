import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_classes.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_functios.dart';
import 'package:getx_api/utils/statics/colors.dart';
import 'package:getx_api/utils/statics/sizedbox.dart';
import 'package:getx_api/utils/statics/static_variables.dart';

import '../apis/forget_pass_api.dart';

class ForgotPassView extends StatefulWidget {
  ForgotPassView({Key? key}) : super(key: key);

  @override
  State<ForgotPassView> createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Image.asset(
                  'assets/images/forget_pass.png',
                  height: 200,
                ),
              ),
              const Text(
                "Reset Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              sizedBoxHeight20,
              const Text(
                "Enter the email associated with your account\nand we will send an email with instruction to\nreset your password.",
                style: TextStyle(fontSize: 18, color: greyColor),
              ),
              sizedBoxHeight40,
              const Text(
                "Email address",
                style: TextStyle(fontSize: 17),
              ),
              CustomTextFormField(
                obscuretext: false,
                hintText: "Enter Email",
                controller: resetEmailController,
              ),
              sizedBoxHeight40,
              Align(
                child: customButton(
                    name: "Send OTP",
                    color: blueColor,
                    onTap: () {
                      if (resetEmailController.text.isNotEmpty) {
                        apiForForgetPass();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
