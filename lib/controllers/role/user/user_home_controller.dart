

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/models/role/user_model/all_catagory_model.dart';
import 'package:service_app/services/api_checker.dart';
import 'package:service_app/services/api_client.dart';
import 'package:service_app/services/api_constants.dart';

import '../../../utils/app_constants.dart';

class UserHomeController extends GetxController{

@override
  void onInit() {
  userCategory();
    // TODO: implement onInit
    super.onInit();
  }


  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  var catagoryLoading=false.obs;

  RxList<UserAllCategoryModel>  categoryModel= <UserAllCategoryModel>[].obs;


   userCategory()async{
     catagoryLoading(true);
     var response=await ApiClient.getData(ApiConstants.userAllCategoryEndPoint);

     if(response.statusCode==200){
       categoryModel.value=List<UserAllCategoryModel>.from(response.body['data']['attributes'].map((x) => UserAllCategoryModel.fromJson(x)));
       catagoryLoading(false);
       update();
     }
     else{
       ApiChecker.checkApi(response);
       catagoryLoading(false);
       update();
     }



   }





}