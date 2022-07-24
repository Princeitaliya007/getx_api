import 'dart:developer';
import 'package:dio/dio.dart';

import '../models/userdata_model.dart';

class ApiForUser {
  ApiForUser._();

  static final ApiForUser apiForUser = ApiForUser._();

  Future<List<UserDataModel>?> userListApi() async {
    try {
      var response = await Dio().get(
        'https://reqres.in/api/users?page=2',
      );

      if (response.statusCode == 200) {
        List userList = response.data["data"];

        List<UserDataModel> data = userList
            .map(
              (e) => UserDataModel.formJson(e),
            )
            .toList();

        log("Data ==============> $userList");

        return data;
      }
    } catch (e) {
      print("object --> ${e.toString()}");
    }
    return null;
  }
}
