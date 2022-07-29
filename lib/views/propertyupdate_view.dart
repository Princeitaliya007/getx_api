import 'package:flutter/material.dart';
import 'package:getx_api/apis/propertydelete_api.dart';
import 'package:getx_api/apis/propertyupdate_api.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_classes.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_functios.dart';
import 'package:getx_api/utils/statics/colors.dart';
import 'package:getx_api/utils/statics/sizedbox.dart';
import 'package:getx_api/utils/statics/static_variables.dart';

class PropertyUpdateView extends StatefulWidget {
  PropertyUpdateView({Key? key}) : super(key: key);

  @override
  State<PropertyUpdateView> createState() => _PropertyUpdateViewState();
}

class _PropertyUpdateViewState extends State<PropertyUpdateView> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Property Update Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              CustomTextFormField(
                obscuretext: false,
                controller: proNameUpdateController,
              ),
              CustomTextFormField(
                obscuretext: false,
                controller: phoneUpdateController,
              ),
              CustomTextFormField(
                obscuretext: false,
                controller: priceUpdateController,
              ),
              CustomTextFormField(
                obscuretext: false,
                controller: areaSfitUpdateController,
              ),
              sizedBoxHeight40,
              customButton(
                name: 'Update',
                color: blueColor,
                onTap: () {
                  apiUpdateForProperty();
                },
              ),
              sizedBoxHeight20,
              customButton(
                name: 'Delete',
                color: Colors.red,
                onTap: () {
                  apiDeleteForProperty();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
