import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/api_checker.dart';
import '../../services/api_client.dart';
import '../../services/api_constants.dart';
import '../helpers/route.dart';
import '../models/more_information_model.dart';

class InformationController extends GetxController {
  var loading = false.obs;
  Rx<InformationModel> informationModel = InformationModel(
      id: 'id',
      name: 'name',
      email: 'email',
      role: 'role',
      phone: 'phone',
      address: 'address',
      latitude: 0.0,
      longitude: 0.0,
      privacyPolicyAccepted: false,
      isAdmin: false,
      isVerified: false,
      isDeleted: false,
      isBlocked: false,
      image: [],
      driverLicenceFront: [],
      driverLicenceBack: [],
      oneTimeCode: null,
      version: 0).obs;

  ///======================update profile============================>

  informationProfile(String address, profile, driverLicenseFront, driverLicenseback,latitude,longitude, File? image) async {

    List<MultipartBody> multipartBody =
    image == null ? [] : [MultipartBody("image", image)];
    Map<String, String> body = {
      "address": address,
      "profile": profile,
      "driverLicenseFront":  driverLicenseFront,
      "driverLicenseback":  driverLicenseback,
      "latitude":  latitude,
      "longitude":  longitude,
    };

    debugPrint("================$address, $profile, $driverLicenseFront, $driverLicenseback, $latitude,$longitude ${image!.path}");

    var response = await ApiClient.patchMultipartData(
      ApiConstants.updateProfileEndPoint,
      body,
      multipartBody: multipartBody,
    );
    print("===========response body : ${response.body} \nand status code : ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      informationModel.value = informationModel(response.body['data']['attributes']);
      informationModel.refresh();
      Get.offAllNamed(AppRoutes.signInScreen);
    } else {
      ApiChecker.checkApi(response);
    }
  }
}
