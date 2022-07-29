import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:getx_api/apis/otp_api.dart';
import 'package:getx_api/utils/statics/sizedbox.dart';

import '../utils/statics/colors.dart';
import '../utils/statics/static_variables.dart';

class OtpView extends StatefulWidget {
  OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
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
                  'assets/images/otp.png',
                  height: 200,
                ),
              ),
              sizedBoxHeight20,
              const Text(
                "Enter OTP",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              sizedBoxHeight20,
              Text(
                "An 6 digit code has send to Your Email\n${resetEmailController.text}",
                style: const TextStyle(fontSize: 18, color: greyColor),
              ),
              sizedBoxHeight40,
              OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  user.write('otp', verificationCode);
                  apiOtpForProperty();
                }, // end onSubmit
              ),
            ],
          ),
        ),
      ),
    );
  }
}
