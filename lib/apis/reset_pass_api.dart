import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/utils/statics/static_variables.dart';

void apiForResetPass() async {
  Dio dio1 = Dio();

  try {
    var dd = {
      "email": emailLoginController.text,
      "password": resetPassController.text
    };

    // loginToken = user.read('logintoken');

    log("map data --> $dd");
    var response = await dio1.post(
      'http://192.168.29.135:3000/auth/change_password',
      data: dd,
    );
    // options: Options(headers: {"authorization": loginToken}));
    if (response.statusCode == 200) {
      Get.snackbar(response.data['message'], "your data added successfully...",
          icon: const Icon(Icons.check_box));
      Get.toNamed('/');
      log("==============<<<<<${response.data}>>>>>");
    } else {
      log(response.statusCode.toString());
    }
    log("response --> ${response.data}");
  } on DioError catch (e) {
    log(e.message);
  } catch (e) {
    print("object --> ${e.toString()}");
  }
}
