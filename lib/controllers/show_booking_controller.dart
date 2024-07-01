import 'package:get/get.dart';
import 'package:service_app/models/show_booking_model.dart';
import '../../services/api_client.dart';
import '../models/recent_booking_model.dart';
import '../services/api_checker.dart';
import '../services/api_constants.dart';
import '../utils/app_constants.dart';

class ShowBookingController extends GetxController {

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  var showGroupList = <ShowBookingModel>[].obs;
  RxList<RecentBookingModel> recentbookingModel=<RecentBookingModel>[].obs;


  var selectedAddress = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    showGetGroupList();
  }

  showGetGroupList() async {
    isLoading(true);
    final response = await ApiClient.getData(ApiConstants.showBookingEndPoint);
    print("=======> ${response.body} \n ${response.statusCode} ");
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      var showBookingModel = ShowBookingModel.fromJson(jsonResponse);
      showGroupList.value = [showBookingModel];
      if (showGroupList.isNotEmpty) {
        selectedAddress.value = showGroupList[0].data?.attributes?.address ?? '';
      }
    }
    else {
      print("Error fetching data: ${response.body['message']}");
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

  recentBooking()async{
    var response=await ApiClient.getData(ApiConstants.recentBookingEndPoint);
    if(response.statusCode==200){
      recentbookingModel.value=List<RecentBookingModel>.from(response.body['data']['attributes'].map((x) => RecentBookingModel.fromJson(x)));
      rxRequestStatus(Status.completed);
      update();

    }else if(response.statusCode==404){
    //  recentbookingModel.value=List<RecentBookingModel>.from(response.body['data']['attributes'].map((x) => RecentBookingModel.fromJson(x)));
      rxRequestStatus(Status.completed);
    }

    else{
      if (ApiClient.noInternetMessage == response.statusText) {
        setRxRequestStatus(Status.internetError);
      }
      else
      {
        setRxRequestStatus(Status.error);
      }

      ApiChecker.checkApi(response);
      update();

    }


  }


}
