import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/utils/statics/static_variables.dart';

void apiForForgetPass() async {
  Dio dio1 = Dio();

  try {
    var dd = {"data": resetEmailController.text};

    // loginToken = user.read('logintoken');

    log("map data --> $dd");
    var response = await dio1.post(
      'http://192.168.29.135:3000/auth/forget_password',
      data: dd,
    );
    // options: Options(headers: {"authorization": loginToken}));
    if (response.statusCode == 200) {
      Get.snackbar(response.data['message'], "your data added successfully...",
          icon: const Icon(Icons.check_box));
      Get.toNamed('/otpView');
      log("==============<<<<<${response.data}>>>>>");
    } else {
      log(response.statusCode.toString());
    }
    log("response --> ${response.data}");
  } on DioError catch (e) {
    print("object --> ${e.toString()}");
    Get.snackbar(
      e.message,
      e.response!.data["message"],
      backgroundColor: Colors.red,
    );
    print("object message --> ${e.response!.data["message"]}");
  } catch (e) {
    print("object --> ${e.toString()}");
  }
}
