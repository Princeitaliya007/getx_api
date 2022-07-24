import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void getApiForLogin() async {
  try {
    var response = await Dio().post(
      'https://reqres.in/api/login',
      data: {"email": "eve.holt@reqres.in", "password": "pistol"},
    );
    if (response.statusCode == 200) {
      Get.toNamed('/homeView');
    } else {
      log(response.statusCode.toString());
    }
    log("response --> ${response.data}");
  } catch (e) {
    print("object --> ${e.toString()}");
  }
}
