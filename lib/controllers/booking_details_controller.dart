import 'package:get/get.dart';
import '../../services/api_client.dart';
import '../../utils/app_constants.dart';
import '../helpers/pref_helpers.dart';
import '../models/booking_details_model.dart';
import '../services/api_checker.dart';
import '../services/api_constants.dart';

class BookingDetailsController extends GetxController {
  var bookingDetailsGroupList = <BookingDetailsModel>[].obs;
  var isLoading = false.obs;



  @override
  void onInit() {
    super.onInit();

  }

  bookingDetailsGetGroupList() async {
    isLoading(true);
    String bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
    var headers = {
      'Authorization': 'Bearer $bearerToken',
    };
    print(headers);

    final response = await ApiClient.getData(ApiConstants.bookingDetailsEndPoint, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = response.body['data']['attributes'];
      bookingDetailsGroupList.value = jsonResponse.map((data) => BookingDetailsModel.fromJson(data)).toList();
      isLoading(false);
    } else {
      ApiChecker.checkApi(response);
    }

  }
}
