import 'package:get/get.dart';
import 'package:service_app/models/show_booking_model.dart';
import '../../services/api_client.dart';
import '../../utils/app_constants.dart';
import '../helpers/pref_helpers.dart';
import '../services/api_checker.dart';
import '../services/api_constants.dart';

class ShowBookingController extends GetxController {
  var showGroupList = <ShowBookingModel>[].obs;
  var isLoading = false.obs;



  @override
  void onInit() {
    super.onInit();

  }

  showGetGroupList() async {
    isLoading(true);
    String bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
    var headers = {
      'Authorization': 'Bearer $bearerToken',
    };
    print(headers);

    final response = await ApiClient.getData(ApiConstants.showBookingEndPoint, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = response.body['data']['attributes'];
      showGroupList.value = jsonResponse.map((data) => ShowBookingModel.fromJson(data)).toList();
      isLoading(false);
    } else {
      ApiChecker.checkApi(response);
    }

  }
}
