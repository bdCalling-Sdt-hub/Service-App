import 'dart:convert';
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
  RxString role = "Provider".obs;
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
    var header = {'Content-Type': 'application/json'};
    var body = {
            "name": fullNameCtrl.text.trim(),
            "email": emailCtrl.text.trim(),
            "phone": phoneCtrl.text.trim(),
            "password": passwordCtrl.text,
             "role": '$role',
    };

    print("=======>>> $body");
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


  // <====================== Sign in =================->

  TextEditingController signInPassCtrl = TextEditingController();
  TextEditingController signInEmailCtrl = TextEditingController();
  var signInLoading = false.obs;

  handleSignIn() async {
    try {
      signInLoading(true);
      var headers = {
        'Content-Type': 'application/json',
      };
      Map<String, dynamic> body = {
        'email': signInEmailCtrl.text.trim(),
        'password': signInPassCtrl.text.trim(),
      };
      Response response = await ApiClient.postData(
        ApiConstants.signInEndPoint,
        json.encode(body),
        headers: headers,
      );

      print("====> ${response.body}");
      if (response.statusCode == 200) {
        var responseBody = response.body;

        if (responseBody != null && responseBody['data'] != null) {
          var data = responseBody['data'];
          await PrefsHelper.setString(AppConstants.bearerToken, data['token']);
          await PrefsHelper.setString(AppConstants.id, data['attributes']['_id']);

          String userRole = data['attributes']['role'];
          await PrefsHelper.setString(AppConstants.role, userRole);

          if (userRole == Role.Provider.name) {
            if (data['attributes']['user'] != null && data['attributes']['user']) {
              Get.offAllNamed(AppRoutes.userBottomNavBar);
              await PrefsHelper.setBool(AppConstants.isLogged, true);
            } else {
              Get.offAllNamed(AppRoutes.providerBottomNavBar);
            }
          } else if (userRole == Role.User.name) {
            Get.offAllNamed(AppRoutes.providerBottomNavBar);
            await PrefsHelper.setBool(AppConstants.isLogged, true);
          }

          print("====================================================Ebrahim");
          signInEmailCtrl.clear();
          signInPassCtrl.clear();
        } else {
          Fluttertoast.showToast(msg: "Unexpected response structure");
        }
      } else {
        Fluttertoast.showToast(msg: response.statusText ?? "Error");
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(msg: "An error occurred");
    } finally {
      signInLoading(false);
    }
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
        await PrefsHelper.setString(AppConstants.bearerToken, response.body["data"]['token']);
        var role = response.body["data"]['type'];
        print("===> role : $role");
        otpCtrl.clear();
        if( type ==  "signup"){
          Get.toNamed(AppRoutes.moreInformationScreen, parameters: {"email" : email});
        }else{
          Get.offAllNamed(AppRoutes.resetPasswordScreen);
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


  ///==================forgot password===============>
  TextEditingController forgetEmailTextCtrl=TextEditingController();
  TextEditingController forgetConfirmPassTextCtrl=TextEditingController();
  TextEditingController forgetNewPassTextCtrl=TextEditingController();
  var forgotLoading = false.obs;

  handleForget()async{
    forgotLoading(true);
    var body = {
      "email":forgetEmailTextCtrl.text.trim(),
    };
    var headers = {
      'Content-Type': 'application/json'
    };
    var response= await ApiClient.postData(ApiConstants.forgotPasswordEndPoint, json.encode(body),headers: headers);
    if(response.statusCode==200 || response.statusCode == 201){

      Get.toNamed(AppRoutes.verifyOTpScreen, parameters: {
        "email": forgetEmailTextCtrl.text.trim(),
        "screenType": "forgetPasswordScreen",
      });

      forgetEmailTextCtrl.clear();
    }else{
      ApiChecker.checkApi(response);
    }
    forgotLoading(false);
  }



  /// <-------------------------- reset password --------------->
  var resetPasswordLoading = false.obs;

  resetPassword(String email, String password) async {
    print("=======> $email, and $password");
    resetPasswordLoading(true);
    var body = {"email": email, "password": password};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstants.resetPasswordEndPoint, json.encode(body),
        headers: header);
    if (response.statusCode == 200){
      showDialog(context: Get.context!,
          barrierDismissible:false,
          builder:(_)=> AlertDialog(
            title: const Text("Password reset!"),
            content: const Text("Your password has been reset successfully."),
            actions: [
              TextButton(
                  onPressed:(){
                    Get.back();
                    Get.back();
                    Get.back();
                    Get.back();
                  }, child:const Text("Ok"))
            ],
          ));

    } else {
      debugPrint("error set password ${response.statusText}");
      Fluttertoast.showToast(msg: "${response.statusText}",);
    }
    resetPasswordLoading(false);
  }


}
