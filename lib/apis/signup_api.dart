import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_api/utils/statics/static_variables.dart';

void getApiForSignup() async {
  try {
    var response = await Dio().post(
      'https://reqres.in/api/register',
      data: {"email": "eve.holt@reqres.in", "password": "pistol"},
    );
    if (response.statusCode == 200) {
      Get.toNamed('/');
    } else {
      log(response.statusCode.toString());
    }
    log("response --> ${response.data}");
  } catch (e) {
    print("object --> ${e.toString()}");
  }
}
