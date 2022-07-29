import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api/utils/statics/static_variables.dart';
import 'package:getx_api/utils/statics/strings.dart';

final user = GetStorage();

void apiForProperty() async {
  var dio = Dio(); // with default Options

//    Set default configs
//   dio.options.baseUrl = 'http://192.168.29.135:3000/user/add_property';
//   dio.options.connectTimeout = 5000; //5s
//   dio.options.receiveTimeout = 3000;

// or new Dio with a BaseOptions instance.
  // var options = BaseOptions(
  //   baseUrl: 'http://192.168.29.135:3000/user/add_property',
  //   connectTimeout: 5000,
  //   receiveTimeout: 3000,
  // );

  Dio dio1 = Dio();

  try {
    log("<<<<<<<<<${propertyNameController.text}...${latitudeController.text}>>>>>>>>>>");

    var dd = {
      "propertyName": propertyNameController.text,
      "propertyDescription": propertyDescriptionController.text,
      "propertyImage": propertyImageController.text,
      "phoneNumber": phoneNumberController.text,
      "propertyCategory": propertyCategoryController.text,
      "constructionStatus": constructionStatusController.text,
      "propertyType": propertyTypeController.text,
      "address": addressController.text,
      "latitude": double.parse(latitudeController.text),
      "longitude": double.parse(longitudeController.text),
      "price": int.parse(priceController.text),
      "areaSquareFt": areaSquareftController.text
    };

    loginToken = user.read('logintoken');

    log("map data --> $dd");
    var response = await dio1.post(
        'http://192.168.29.135:3000/user/add_property',
        data: dd,
        options: Options(headers: {"authorization": loginToken}));
    if (response.statusCode == 200) {
      Get.snackbar(response.data['message'], "your data added successfully...",
          icon: const Icon(Icons.check_box));
      Get.toNamed('/propertydetailView');
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
