import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import '../../services/api_client.dart';

import '../helpers/route.dart';
import '../services/api_checker.dart';
import '../services/api_constants.dart';

class InformationController extends GetxController {
  var loading = false.obs;
  Uint8List? image;
  Uint8List? frontSideImage;
  Uint8List? backSideImage;

  ///======================update profile============================>
  moreInformationProfile(String address, File? profileImage,
      File? driverLicenseFront,File? driverLicenseback) async {
    List<MultipartBody> multipartBody = [
      MultipartBody("profile", profileImage!),
      MultipartBody("driverLicenseFront", driverLicenseFront!),
      MultipartBody("driverLicenseback", driverLicenseback!),

    ];
    Map<String, String> body = {
      "address": address,
    };


    print('======================> $multipartBody  ==> $body');

    var response = await ApiClient.patchMultipartData(
      ApiConstants.updateProfileEndPoint,
      body,
      multipartBody: multipartBody,
    );
    print(
        "===========response body : ${response.body} \nand status code : ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.offAllNamed(AppRoutes.signInScreen);
    } else {
      ApiChecker.checkApi(response);
    }
  }
}
