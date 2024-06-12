import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../services/api_client.dart';
import '../helpers/route.dart';
import '../services/api_constants.dart';

class AuthController extends GetxController {

  RxBool isSelectedRole = true.obs;
  RxString role = "client".obs;
  var signUpLoading = false.obs;
  var token = "";

  ///==================role selected==============>
  void selectRole(String selectedRole) {
    role.value = selectedRole;
  }
  ///<===== ============== sign up =============== =====>

  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final conPasswordCtrl = TextEditingController();

  handleSignUp() async {
    signUpLoading(true);
    Map<String, String> header = {'Content-Type': 'application/json'};
    var body = {
            "fullName": fullNameCtrl.text.trim(),
            "email": emailCtrl.text.trim(),
            "phone": phoneCtrl.text.trim(),
            "password": passwordCtrl.text,
            "role": role.value,
    };
    var response = await ApiClient.postData(
      ApiConstants.signUp,
      json.encode(body),
      headers: header,
    );
    if (response.statusCode == 200) {
      debugPrint("Sign up");
      Get.toNamed(AppRoutes.verifyOTpScreen, parameters: {
        "email": emailCtrl.text.trim(),
        "screenType": "signup"
      });
    }
    signUpLoading(false);
  }


}
