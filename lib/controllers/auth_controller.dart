// import 'dart:convert';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../../services/api_checker.dart';
// import '../../services/api_client.dart';
//
// class AuthController extends GetxController {
//
//
//
//
//   final fullNameCtrl = TextEditingController();
//   final emailCtrl = TextEditingController();
//   final passwordCtrl = TextEditingController();
//   final conPasswordCtrl = TextEditingController();
//   RxBool isSelectedRole = true.obs;
//   RxString role = "client".obs;
//   var signUpLoading = false.obs;
//   var token = "";
//
//   ///==================role selected==============>
//   void selectRole(String selectedRole) {
//     role.value = selectedRole;
//   }
//
//
//
//
//
//
//   /// <====================== Sign in =================->
//   TextEditingController signInPassCtrl = TextEditingController();
//   TextEditingController signInEmailCtrl = TextEditingController();
//   var signInLoading =false.obs;
//
//
//   handleSignIn()async{
//     signInLoading(true);
//     var headers = {
//       //'Content-Type': 'application/x-www-form-urlencoded'
//       'Content-Type': 'application/json'
//     };
//     Map<String,dynamic> body={
//       'email': signInEmailCtrl.text.trim(),
//       'password': signInPassCtrl.text.trim()
//     };
//     Response response= await ApiClient.postData(ApiConstants.loginEndPoint,json.encode(body),headers: headers);
//     print("====> ${response.body}");
//     if(response.statusCode==200){
//
//       await  PrefsHelper.setString(AppConstants.bearerToken,response.body['data']['attributes']['tokens']['access']['token']);
//       await  PrefsHelper.setString(AppConstants.id,response.body['data']['attributes']['user']['id']);
//
//       String userRole = response.body['data']['attributes']['user']['role'];
//       await PrefsHelper.setString(AppConstants.role, userRole);
//       // await PrefsHelper.setBool(AppConstants.isLogged, true);
//
//       if(userRole == Role.employee.name){
//         if(response.body['data']['attributes']['user']['isInterest']){
//           Get.offAllNamed(AppRoutes.taskerBottomNavBar);
//           await PrefsHelper.setBool(AppConstants.isLogged, true);
//         }else{
//           Get.offAllNamed(AppRoutes.addInterestScreen);
//         }
//       }else if(userRole == Role.client.name){
//         Get.offAllNamed(AppRoutes.requesterBottomNavBar);
//         await PrefsHelper.setBool(AppConstants.isLogged, true);
//       }
//
//       print("====================================================Sagor ");
//       signInEmailCtrl.clear();
//       signInPassCtrl.clear();
//     } else{
//       //  ApiChecker.checkApi(response);
//       Fluttertoast.showToast(msg:response.statusText??"");
//     }
//     signInLoading(false);
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// }
