import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final user = GetStorage();

void apiOtpForProperty() async {
  Dio dio1 = Dio();

  try {
    // loginToken = user.read('logintoken');

    var dd = {"otp": user.read('otp')};
    log("map data --> $dd");
    var response = await dio1.post(
      'http://192.168.29.135:3000/auth/otp_verification',
      data: dd,
    );

    if (response.statusCode == 200) {
      Get.snackbar(response.data['message'], "your data added successfully...",
          icon: const Icon(Icons.check_box));
      Get.toNamed('/resetpassView');
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
