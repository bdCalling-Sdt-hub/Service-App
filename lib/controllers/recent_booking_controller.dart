import 'package:get/get.dart';
import 'package:service_app/models/recent_booking_model.dart';
import '../../services/api_client.dart';
import '../../utils/app_constants.dart';
import '../helpers/pref_helpers.dart';
import '../services/api_checker.dart';
import '../services/api_constants.dart';

class RecentBookingController extends GetxController {
  var recentGroupList = <RecentBookingModel>[].obs;
  var isLoading = false.obs;



  @override
  void onInit() {
    super.onInit();
  }

  recentGetGroupList() async {
    isLoading(true);
    String bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
    var headers = {
      'Authorization': 'Bearer $bearerToken',
    };
    print(headers);

    final response = await ApiClient.getData(ApiConstants.recentBookingEndPoint, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = response.body['data']['attributes'];
      recentGroupList.value = jsonResponse.map((data) => RecentBookingModel.fromJson(data)).toList();
      isLoading(false);
    } else {
      ApiChecker.checkApi(response);
    }

  }
}
