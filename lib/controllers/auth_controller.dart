import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            "role": 'User',
    };
    var response = await ApiClient.postData(
      ApiConstants.signUpEndPoint,
      jsonEncode(body),
      headers: header,
    );

    print("======================================>>> ${response.body}, and \n $body and ${body.runtimeType}");
    if (response.statusCode == 200) {
      debugPrint("Sign up===============================");
      Get.toNamed(AppRoutes.verifyOTpScreen, parameters: {
        "email": emailCtrl.text.trim(),
        "screenType": "signup"
      });
    }
    signUpLoading(false);
  }


  /// ============== resend otp================>
  var resendOtpLoading = false.obs;
  resendOtp(String email) async {
    resendOtpLoading(true);
    var body = {"email": email};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstants.forgotEndPoint, json.encode(body),
        headers: header);
    print("===> ${response.body}");
    if (response.statusCode == 200) {

    } else {
      Fluttertoast.showToast(
          msg: response.statusText ?? "",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.CENTER);
    }
    resendOtpLoading(false);
  }

  //=====================================> Otp verify <====================================
  TextEditingController otpCtrl = TextEditingController();
  var verifyLoading = false.obs;

  handleOtpVery(
      {required String email,
        required String otp,
        required String type}) async {
    try {
      var body = {'code': otp, 'email': email};
      var headers = {'Content-Type': 'application/json'};
      verifyLoading(true);
      Response response = await ApiClient.postData(
          ApiConstants.otpVerifyEndPoint, json.encode(body),
          headers: headers);
      print("============${response.body} and ${response.statusCode}");
      if (response.statusCode == 200) {
        await PrefsHelper.setString(AppConstants.role, response.body["data"]['token']);
        var role = response.body["data"]['token'];
        print("===> role : $role");
        otpCtrl.clear();
        if( type ==  "signup"){
          Get.toNamed(AppRoutes.moreInformationScreen, parameters: {"email" : email});
        }else{
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
