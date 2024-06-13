import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../services/api_client.dart';
import '../helpers/pref_helpers.dart';
import '../helpers/route.dart';
import '../services/api_checker.dart';
import '../services/api_constants.dart';
import '../utils/app_constants.dart';

class AuthController extends GetxController {

  RxBool isSelectedRole = true.obs;
  RxString role = "client".obs;
  var signUpLoading = false.obs;
  var token = "";
  String selectedCountryCode = '+880';

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
            "name": fullNameCtrl.text.trim(),
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
      debugPrint("Sign up===============================");
      Get.toNamed(AppRoutes.verifyOTpScreen, parameters: {
        "email": emailCtrl.text.trim(),
        "screenType": "signup"
      });
    }
    signUpLoading(false);
  }


  //=====================================> Otp verify <====================================
  TextEditingController otpCtrl = TextEditingController();
  var verifyLoading = false.obs;

  handleOtpVery(
      {required String phone,
        required String otp,
        required String type}) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    try {
      var body = {'phone': phone, 'otpCode': otp};
      verifyLoading(true);
      Response response = await ApiClient.postData(ApiConstants.otpVerify, jsonEncode(body), headers: headers);

      print("===========.> $response");
      print("============${response.body} and ${response.statusCode}");
      if (response.statusCode == 200) {
        await PrefsHelper.setString(AppConstants.bearerToken, response.body["data"]['token']);

        print('================token ${response.body["data"]['token']}');

        if (type == "forgotPasswordScreen") {
          Get.toNamed(AppRoutes.resetPasswordScreen,
              parameters: {"phone": phone});
        } else {
          Get.offAllNamed(AppRoutes.signInScreen);
        }

      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e, s) {
      print("===> e : $e");
      print("===> s : $s");
    }
    verifyLoading(false);
  }


}
