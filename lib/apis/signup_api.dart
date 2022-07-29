import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/utils/statics/static_variables.dart';

void apiForSignUp() async {
  var dio = Dio();

  dio.options.baseUrl = 'http://192.168.29.135:3000/auth/signUp';
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 3000;

  var options = BaseOptions(
    baseUrl: 'http://192.168.29.135:3000/auth/signUp',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  Dio dio1 = Dio(options);

  try {
    var response = await dio1.post(
      'http://192.168.29.135:3000/auth/signUp',
      data: {
        "name": nameSignupController.text,
        "email": emailSignupController.text,
        "password": passwordSignupController.text,
        "phoneNumber": phoneSignupController.text
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar(response.data['message'], "You are signup success",
          icon: const Icon(Icons.check_box));
      Get.toNamed('/');
      log(response.data);
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
