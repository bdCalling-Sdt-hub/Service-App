
import 'package:get/get.dart';
import 'package:service_app/views/screen/OnBoarding/onboarding_screen.dart';

class SplashController extends GetxController{
  Timer(){
    const Duration(seconds: 3);
    Get.to(const OnBoardingScreen());
  }
}