
import 'package:get/get.dart';

import '../helpers/pref_helpers.dart';
import '../helpers/route.dart';
import '../utils/app_constants.dart';





class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false})async{

    if(response.statusCode != 200){
      if(response.statusCode == 401) {
        await PrefsHelper.remove(AppConstants.role);
        await PrefsHelper.remove(AppConstants.isLogged);
        await PrefsHelper.remove(AppConstants.bearerToken);
        Get.offAllNamed(AppRoutes.signInScreen);
        Get.offAllNamed(AppRoutes.signInScreen);
      }else {
        // showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
      }

    }


  }
}