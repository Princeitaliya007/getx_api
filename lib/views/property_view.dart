import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/apis/property_api.dart';
import 'package:getx_api/apis/propertydisplay_api.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_classes.dart';
import 'package:getx_api/utils/custom_widgets/custom_widgets_functios.dart';
import 'package:getx_api/utils/statics/colors.dart';
import 'package:getx_api/utils/statics/sizedbox.dart';

import '../utils/statics/static_variables.dart';
import '../utils/statics/strings.dart';

class Propertyview extends StatefulWidget {
  Propertyview({Key? key}) : super(key: key);

  @override
  State<Propertyview> createState() => _PropertyviewState();
}

class _PropertyviewState extends State<Propertyview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(propertyEstate),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/propertydetailView');
            },
            icon: const Icon(Icons.do_disturb),
          ),
        ],
      ),
      body: Form(
        key: propertyKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter propertyname...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter Property name"),
                controller: propertyNameController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter property description...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter Property Description"),
                controller: propertyDescriptionController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter property image...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter Property Image"),
                controller: propertyImageController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter phonenumber...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter Phonenumber"),
                controller: phoneNumberController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter property category...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter Property Category"),
                controller: propertyCategoryController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter construction status...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter Construction Status"),
                controller: constructionStatusController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter property type...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter Property Type"),
                controller: propertyTypeController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter address...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter Address"),
                controller: addressController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter latitude...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter latitude"),
                controller: latitudeController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter longitude...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter longitude"),
                controller: longitudeController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter price...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter Price"),
                controller: priceController,
              ),
              CustomTextFormField(
                obscuretext: false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter areasquarefit...";
                  } else {
                    return null;
                  }
                },
                label: const Text("Enter AreaSquareft"),
                controller: areaSquareftController,
              ),
              sizedBoxHeight20,
              customButton(
                onTap: () {
                  if (propertyKey.currentState!.validate()) {
                    propertyKey.currentState!.save();
                    apiForProperty();
                  }
                },
                name: "Save",
                color: blueColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
