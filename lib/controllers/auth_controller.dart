import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../services/api_checker.dart';
import '../../services/api_client.dart';
import '../helpers/route.dart';
import '../services/api_constants.dart';

class AuthController extends GetxController {


  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController conPasswordCtrl = TextEditingController();

  RxBool isSelectedRole = true.obs;
  RxString role = "client".obs;
  var signUpLoading = false.obs;
  var token = "";

  ///==================role selected==============>
  void selectRole(String selectedRole) {
    role.value = selectedRole;
  }

  ///<=============Sign Up===========>
  handleSignUp() async {
    signUpLoading(true);
    try {
      Map<String, dynamic> body = {
        "fullName": fullNameCtrl.text.trim(),
        "email": emailCtrl.text.trim(),
        "phone": phoneCtrl.text.trim(),
        "password": passwordCtrl.text,
        "role": "${role.value}",
      };

      print("=================>ROLE ${role.value}");
      print("===================> ${body}");

      var headers = {'Content-Type': 'application/json'};

      Response response = await ApiClient.postData(
          ApiConstants.signUp, jsonEncode(body),
          headers: headers);

      print("============> ${response.body} and ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.verifyOTpScreen, parameters: {
          "email": emailCtrl.text.trim(),
          "screenType": "signup",
        });

        fullNameCtrl.clear();
        emailCtrl.clear();
        phoneCtrl.clear();
        passwordCtrl.clear();
        conPasswordCtrl.clear();
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e, s) {
      print("===> error : $e");
      print("===> error : $s");
    }
    signUpLoading(false);
  }


}
