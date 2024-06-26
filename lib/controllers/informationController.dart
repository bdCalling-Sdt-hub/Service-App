import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/api_client.dart';
import '../models/more_information_model.dart';

class InformationController extends GetxController {
  var loading = false.obs;

  ///======================update profile============================>
  moreInformationProfile(String address, File? profileImage,
      driverLicenseFront, driverLicenseback) async {
    List<MultipartBody> multipartBody = profileImage == null ||
            driverLicenseback == null ||
            driverLicenseFront == null
        ? []
        : [
            ///image list will be here
          ];

    Map<String, String> body = {
      "address": address,
    };

    print('======================> $multipartBody  ==> $body');

    // // debugPrint("================$address, $profile, $driverLicenseFront, $driverLicenseback, $latitude,$longitude ${image!.path}");
    //
    // var response = await ApiClient.patchMultipartData(
    //   ApiConstants.updateProfileEndPoint,
    //   body,
    //   multipartBody: multipartBody,
    // );
    // print(
    //     "===========response body : ${response.body} \nand status code : ${response.statusCode}");
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   informationModel.value =
    //       informationModel(response.body['data']['attributes']);
    //   informationModel.refresh();
    //   Get.offAllNamed(AppRoutes.signInScreen);
    // } else {
    //   ApiChecker.checkApi(response);
    // }
  }
}
