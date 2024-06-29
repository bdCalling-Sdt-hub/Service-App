import 'package:get/get.dart';
import 'package:service_app/models/show_booking_model.dart';
import '../../services/api_client.dart';
import '../services/api_checker.dart';
import '../services/api_constants.dart';

class ShowBookingController extends GetxController {
  var showGroupList = <ShowBookingModel>[].obs;
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
    } else {
      print("Error fetching data: ${response.body['message']}");
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }
}
