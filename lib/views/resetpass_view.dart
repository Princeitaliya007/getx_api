import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/apis/reset_pass_api.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_classes.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_functios.dart';
import 'package:getx_api/utils/statics/static_variables.dart';

import '../utils/statics/colors.dart';
import '../utils/statics/sizedbox.dart';

class ResetPassView extends StatefulWidget {
  ResetPassView({Key? key}) : super(key: key);

  @override
  State<ResetPassView> createState() => _ResetPassViewState();
}

class _ResetPassViewState extends State<ResetPassView> {
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
                  'assets/images/reset_pass.png',
                  height: 200,
                ),
              ),
              sizedBoxHeight20,
              const Text(
                "Reset Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              sizedBoxHeight20,
              CustomTextFormField(
                obscuretext: isObs1,
                icon: const Icon(Icons.lock),
                suffixicon: IconButton(
                  onPressed: () {
                    isObs1 = !isObs1;
                    setState(() {});
                  },
                  icon: (isObs1)
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                        ),
                ),
                hintText: "New Password",
                controller: resetPassController,
              ),
              sizedBoxHeight20,
              CustomTextFormField(
                obscuretext: isObs2,
                icon: const Icon(Icons.lock),
                suffixicon: IconButton(
                  onPressed: () {
                    isObs2 = !isObs2;
                    setState(() {});
                  },
                  icon: (isObs2)
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                        ),
                ),
                hintText: "Confirm New Password",
                controller: confirmPassController,
              ),
              sizedBoxHeight60,
              Align(
                child: customButton(
                  onTap: () {
                    if (resetPassController.text ==
                        confirmPassController.text) {
                      apiForResetPass();
                    }
                  },
                  name: "Reset Password",
                  color: blueColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
