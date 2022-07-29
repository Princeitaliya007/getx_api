import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api/models/propertydata_model.dart';
import 'package:getx_api/utils/statics/static_variables.dart';

class DisplayProperty {
  DisplayProperty._();

  static final DisplayProperty displayProperty = DisplayProperty._();

  final user = GetStorage();

  Future<List<PropertyDataModel>?> apiForDisplayProperty() async {
    // with default Options

    Dio dio1 = Dio();

    try {
      var response = await dio1.get(
          'http://192.168.29.135:3000/user/get_user_property',
          options:
              Options(headers: {"authorization": user.read('logintoken')}));
      if (response.statusCode == 200) {
        // Get.snackbar(
        //     response.data['message'], "your data added successfully...",
        //     icon: const Icon(Icons.check_box));

        List<dynamic> data = response.data['data'];

        // ignore: non_constant_identifier_names
        List<PropertyDataModel> Alldata =
            data.map((e) => PropertyDataModel.fromJson(e)).toList();
        Get.toNamed('/propertydetailView');

        return Alldata;
      } else {
        log(response.statusCode.toString());
      }
    } on DioError catch (e) {
      log(e.message);
    } catch (e) {
      print("object --> ${e.toString()}");
    }
  }
}
