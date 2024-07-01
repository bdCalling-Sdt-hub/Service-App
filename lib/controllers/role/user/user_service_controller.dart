


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/role/provider/help_model.dart';
import '../../../services/api_checker.dart';
import '../../../services/api_client.dart';
import '../../../services/api_constants.dart';
import '../../../utils/app_constants.dart';

class UserServiceController extends GetxController{


  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  var page =1;
  var firstLoading=false.obs;
  var loadMoreLoading=false.obs;
  var totalPage=0;
  var currentPage=0;

  RxList<HelpModel> userServiceHelpModel=<HelpModel>[].obs;

  ScrollController scrollController=ScrollController();

  Future userServicehelpFirsLoad()async{
    firstLoading(true);
    var response=await ApiClient.getData('${ApiConstants.providerHelpEndPoint}?page=$page&limit=5');
    if(response.statusCode==200){
      userServiceHelpModel.value= List<HelpModel>.from(response.body['data']['attributes'].map((x) => HelpModel.fromJson(x)));
      currentPage=response.body['pagination']['currentPage'];
      totalPage=response.body['pagination']['totalPages'];
      rxRequestStatus(Status.completed);
      firstLoading(false);
      update();
    } else if(response.statusCode==404){

      rxRequestStatus(Status.completed);
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
      var response=await ApiClient.getData('${ApiConstants.providerHelpEndPoint}?page=$page&limit=5');
      if(response.statusCode==200){
        var result= List<HelpModel>.from(response.body['data']['attributes'].map((x) => HelpModel.fromJson(x)));
        currentPage=response.body['pagination']['attributes']['currentPage'];
        totalPage=response.body['pagination']['attributes']['totalPages'];
        userServiceHelpModel.value.addAll(result);
        userServiceHelpModel.refresh();
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

}