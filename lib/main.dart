import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api/views/detail_view.dart';
import 'package:getx_api/views/forgotpass_view.dart';
import 'package:getx_api/views/home_view.dart';
import 'package:getx_api/views/login_view.dart';
import 'package:getx_api/views/otp_view.dart';
import 'package:getx_api/views/propertydetail_view.dart';
import 'package:getx_api/views/resetpass_view.dart';
import 'package:getx_api/views/signup_view.dart';

import 'views/property_view.dart';
import 'views/propertyupdate_view.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginView(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignupView(),
        ),
        GetPage(
          name: '/detailView',
          page: () => const DetailView(),
        ),
        GetPage(
          name: '/propertyView',
          page: () => Propertyview(),
        ),
        GetPage(
          name: '/propertydetailView',
          page: () => PropertyDetailView(),
        ),
        GetPage(
          name: '/propertyupdateView',
          page: () => PropertyUpdateView(),
        ),
        GetPage(
          name: '/forgotpassView',
          page: () => ForgotPassView(),
        ),
        GetPage(
          name: '/otpView',
          page: () => OtpView(),
        ),
        GetPage(
          name: '/resetpassView',
          page: () => ResetPassView(),
        ),
      ],
    );
  }
}
