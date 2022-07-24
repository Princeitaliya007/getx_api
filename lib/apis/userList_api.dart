import 'package:dio/dio.dart';

import '../models/userdata_model.dart';

class ApiForUser {
  ApiForUser._();

  static final ApiForUser apiForUser = ApiForUser._();

  Future<List<UserDataModel>?> userListApi() async {
    try {
      var response = await Dio().get(
        "https://reqres.in/api/users?page=2",
      );

      if (response.statusCode == 200) {
        List userList = await response.data["data"];

        List<UserDataModel> data = userList
            .map(
              (e) => UserDataModel.fromJson(e),
            )
            .toList();

        return data;
      }
    } catch (e) {
      print("object --> ${e.toString()}");
    }
    return null;
  }
}
