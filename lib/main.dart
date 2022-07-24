import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/views/home_view.dart';
import 'package:getx_api/views/login_view.dart';
import 'package:getx_api/views/signup_view.dart';
import 'bindings/home_binding.dart';
import 'bindings/login_binding.dart';
import 'bindings/singup_binding.dart';

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
      initialRoute: '/homeView',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignupView(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: '/homeView',
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
