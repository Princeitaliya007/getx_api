import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api/utils/statics/static_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dataStore = GetStorage();

void getApiForLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    var response = await Dio().post(
      'http://192.168.29.135:3000/auth/login',
      data: {
        "email": emailLoginController.text,
        "password": passwordLoginController.text
      },
    );
    if (response.statusCode == 200) {
      log("=======>>> ${response.data}");

      // prefs.setString('logintoken', response.data['data']['token']);
      // prefs.setString('loginemail', response.data['data']['email']);

      dataStore.write('logindata', response.data);
      dataStore.write('loginemail', response.data['data']['email']);
      dataStore.write('logintoken', response.data['data']['token']);

      LoginData = dataStore.read('logindata');

      log("===================${response.data['data']['token']}");
      log("===================${response.data['data']['email']}");

      log("login store tokan data -> ${dataStore.read('logintoken')}");
      log("login store email data -> ${dataStore.read('loginemail')}");

      Get.snackbar(LoginData['message'], "You are logged in...",
          icon: const Icon(Icons.check_box));
      // log(LoginData['message']);

      Get.offNamedUntil(
        '/propertyView',
        (route) => false,
      );
    } else {
      log(response.statusCode.toString());
    }
  } on DioError catch (e) {
    print("object --> ${e.toString()}");
    Get.snackbar(
      e.message,
      e.response!.data["message"],
      backgroundColor: Colors.red,
    );
    print("object message --> ${e.response!.data["message"]}");
  }
}
