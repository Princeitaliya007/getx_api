import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api/apis/propertydisplay_api.dart';
import 'package:getx_api/models/propertydata_model.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_classes.dart';
import 'package:getx_api/utils/statics/static_variables.dart';

import '../utils/statics/colors.dart';

class PropertyDetailView extends StatefulWidget {
  PropertyDetailView({Key? key}) : super(key: key);

  @override
  State<PropertyDetailView> createState() => _PropertyDetailViewState();
}

class _PropertyDetailViewState extends State<PropertyDetailView> {
  late Future<List<PropertyDataModel>?> allData;
  final user = GetStorage();

  @override
  void initState() {
    super.initState();
    allData = DisplayProperty.displayProperty.apiForDisplayProperty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () {
            Get.toNamed('/propertyView');
          },
        ),
      ),
      body: FutureBuilder(
          future: allData,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              List<PropertyDataModel> data = snapshot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      proNameUpdateController.text = data[i].proName.toString();
                      phoneUpdateController.text =
                          data[i].phoneNumber.toString();
                      priceUpdateController.text = data[i].price.toString();
                      areaSfitUpdateController.text =
                          data[i].areasfit.toString();

                      user.write('updateid', data[i].id);

                      Get.toNamed('/propertyupdateView', arguments: data[i]);
                    },
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        isThreeLine: true,
                        leading: Text(data[i].areasfit.toString()),
                        title: Text(data[i].proName.toString()),
                        subtitle: Text(
                            "${data[i].price.toString()}\n${data[i].id.toString()}"),
                        trailing: Text(data[i].phoneNumber.toString()),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
