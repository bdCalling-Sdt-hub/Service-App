import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/models/role/user_model/all_catagory_model.dart';
import 'package:service_app/services/api_checker.dart';
import 'package:service_app/services/api_client.dart';
import 'package:service_app/services/api_constants.dart';

import '../../../models/role/provider/help_model.dart';
import '../../../utils/app_constants.dart';

class UserHomeController extends GetxController {
  @override
  void onInit() {
      allData();
    // TODO: implement onInit
    super.onInit();
  }

  allData(){
    userCategory();
    nearbyhelpFirsLoad();
    populerFirsLoad();
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  var page = 1;
  var firstLoading = false.obs;
  var loadMoreLoading = false.obs;
  var totalPage = 0;
  var currentPage = 0;

  RxList<HelpModel> nearbyHelpModel = <HelpModel>[].obs;
  RxList<HelpModel> popularHelpModel = <HelpModel>[].obs;

  ScrollController scrollController=ScrollController();
  var catagoryLoading = false.obs;
  RxList<UserAllCategoryModel> categoryModel = <UserAllCategoryModel>[].obs;

  /// User Catagory

  userCategory() async {
    catagoryLoading(true);
    var response =
        await ApiClient.getData(ApiConstants.userAllCategoryEndPoint);

    if (response.statusCode == 200) {
      categoryModel.value = List<UserAllCategoryModel>.from(response
          .body['data']['attributes']
          .map((x) => UserAllCategoryModel.fromJson(x)));
      catagoryLoading(false);
      update();
    } else {
      ApiChecker.checkApi(response);
      catagoryLoading(false);
      update();
    }
  }


  /// User Nearby Helps

  Future nearbyhelpFirsLoad()async{

    firstLoading(true);
    var response=await ApiClient.getData('${ApiConstants.userNearbyHelpEndPoint}?page=$page&limit=5');
    if(response.statusCode==200){
      nearbyHelpModel.value= List<HelpModel>.from(response.body['data']['attributes'].map((x) => HelpModel.fromJson(x)));
      currentPage=response.body['pagination']['currentPage'];
      totalPage=response.body['pagination']['totalPages'];
      rxRequestStatus(Status.completed);
      firstLoading(false);
      update();

    }
    else{
      if (ApiClient.noInternetMessage == response.statusText) {
        setRxRequestStatus(Status.internetError);
      } else
      {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
      firstLoading.value=false;
      update();
    }

  }

  loadMore()async{
    if(firstLoading !=true &&loadMoreLoading ==false && totalPage !=currentPage){
      page +=1;
      loadMoreLoading (true);
      var response=await ApiClient.getData('${ApiConstants.userNearbyHelpEndPoint}?page=$page&limit=5');
      if(response.statusCode==200){
        var result= List<HelpModel>.from(response.body['data']['attributes'].map((x) => HelpModel.fromJson(x)));
        currentPage=response.body['pagination']['attributes']['currentPage'];
        totalPage=response.body['pagination']['attributes']['totalPages'];
        nearbyHelpModel.value.addAll(result);
        nearbyHelpModel.refresh();
        rxRequestStatus(Status.completed);
        loadMoreLoading(false);
        update();
      }
      else{
        if (ApiClient.noInternetMessage == response.statusText) {
          setRxRequestStatus(Status.internetError);
        } else
        {
          setRxRequestStatus(Status.error);
        }
        ApiChecker.checkApi(response);
        firstLoading.value=false;
        update();
      }

    }
  }


  /// All Popular Help

  Future populerFirsLoad()async{
    firstLoading(true);
    var response=await ApiClient.getData('${ApiConstants.userpopulerHelpEndPoint}?page=$page&limit=5');
    if(response.statusCode==200){
      popularHelpModel.value= List<HelpModel>.from(response.body['data']['attributes'].map((x) => HelpModel.fromJson(x)));
      currentPage=response.body['pagination']['currentPage'];
      totalPage=response.body['pagination']['totalPages'];
      rxRequestStatus(Status.completed);
      firstLoading(false);
      update();

    }
    else{
      if (ApiClient.noInternetMessage == response.statusText) {
        setRxRequestStatus(Status.internetError);
      } else
      {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
      firstLoading.value=false;
      update();
    }

  }




}
