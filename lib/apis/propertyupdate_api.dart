import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api/utils/statics/static_variables.dart';
import 'package:getx_api/utils/statics/strings.dart';

final user = GetStorage();

void apiUpdateForProperty() async {
  Dio dio1 = Dio();

  try {
    log("<<<<<<<<<...${latitudeController.text}>>>>>>>>>>");

    var dd = {
      "id": user.read('updateid'),
      "propertyName": proNameUpdateController.text.toString(),
      "phoneNumber": phoneUpdateController.text.toString(),
      "price": int.parse(priceUpdateController.text.toString()),
      "areaSquareFt": int.parse(areaSfitUpdateController.text.toString()),
    };

    loginToken = user.read('logintoken');

    log("map data --> $dd");
    var response = await dio1.put(
        'http://192.168.29.135:3000/user/update_property',
        data: dd,
        options: Options(headers: {"authorization": loginToken}));
    if (response.statusCode == 200) {
      Get.snackbar(response.data['message'], "your data added successfully...",
          icon: const Icon(Icons.check_box));
      Get.offAllNamed('/propertydetailView');
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
