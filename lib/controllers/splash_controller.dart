
import 'package:get/get.dart';
import 'package:service_app/helpers/pref_helpers.dart';
import 'package:service_app/utils/app_constants.dart';
import 'package:service_app/views/screen/OnBoarding/onboarding_screen.dart';

import '../helpers/route.dart';

class SplashController extends GetxController{
  Timer()async{
    var token=PrefsHelper.getString(AppConstants.bearerToken);
    const Duration(seconds: 3);
    if(token==null){
      Get.to(const OnBoardingScreen());
    }
    else{
      Get.toNamed(AppRoutes.providerBottomNavBar);
    }

  }
}