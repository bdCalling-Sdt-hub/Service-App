import 'package:get/get.dart';
import '../../services/api_client.dart';
import '../models/booking_details_model.dart';
import '../services/api_checker.dart';
import '../services/api_constants.dart';

class BookingDetailsController extends GetxController {
  Rx<BookingDetailsModel> bookingDetailsModel = BookingDetailsModel().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> bookingDetailsGetGroupList(String productId) async {
    isLoading(true);
    final response = await ApiClient.getData('${ApiConstants.bookingDetailsEndPoint}?id=$productId');
    if (response.statusCode == 200) {
      bookingDetailsModel.value = BookingDetailsModel.fromJson(response.body['data']['attributes']);

    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
    update();
  }
}
