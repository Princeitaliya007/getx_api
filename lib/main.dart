import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/views/detail_view.dart';
import 'package:getx_api/views/home_view.dart';
import 'package:getx_api/views/login_view.dart';
import 'package:getx_api/views/signup_view.dart';

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
        ),
        GetPage(
          name: '/signup',
          page: () => const SignupView(),
        ),
        GetPage(
          name: '/homeView',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/detailView',
          page: () => const DetailView(),
        ),
      ],
    );
  }
}
