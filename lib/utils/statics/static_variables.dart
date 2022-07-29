import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final TextEditingController emailSignupController = TextEditingController();
final TextEditingController passwordSignupController = TextEditingController();
final TextEditingController phoneSignupController = TextEditingController();
final TextEditingController nameSignupController = TextEditingController();
final TextEditingController emailLoginController = TextEditingController();
final TextEditingController passwordLoginController = TextEditingController();
final TextEditingController phoneLoginController = TextEditingController();
final TextEditingController nameLoginController = TextEditingController();

// Property Controllers

final TextEditingController propertyNameController = TextEditingController();
final TextEditingController propertyDescriptionController =
    TextEditingController();
final TextEditingController propertyImageController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController propertyCategoryController =
    TextEditingController();
final TextEditingController constructionStatusController =
    TextEditingController();
final TextEditingController propertyTypeController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController latitudeController = TextEditingController();
final TextEditingController longitudeController = TextEditingController();
final TextEditingController priceController = TextEditingController();
final TextEditingController areaSquareftController = TextEditingController();

// Property Update Controllers

final TextEditingController areaSfitUpdateController = TextEditingController();
final TextEditingController proNameUpdateController = TextEditingController();
final TextEditingController priceUpdateController = TextEditingController();
final TextEditingController phoneUpdateController = TextEditingController();

// reset Password Controllers

final TextEditingController resetEmailController = TextEditingController();
final TextEditingController resetPassController = TextEditingController();
final TextEditingController confirmPassController = TextEditingController();

// Global key

GlobalKey<FormState> signupKey = GlobalKey<FormState>();
GlobalKey<FormState> loginKey = GlobalKey<FormState>();
GlobalKey<FormState> propertyKey = GlobalKey<FormState>();

// GetStorage

Map<String, dynamic> LoginData = {};
Map<String, dynamic> SignupData = {};

// bool

var isObs1 = false;
var isObs2 = false;
