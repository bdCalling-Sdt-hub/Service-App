import 'package:get/get.dart';
import 'package:service_app/views/screen/Auth/signUpScreen/InnerWidget/sign_up_screen.dart';

import '../views/screen/OnBoarding/onboarding_screen.dart';
import '../views/screen/Splash/splash_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String onBoardingScreen="/onBoarding_screen";
  static String signUpScreen="/signup_screen";

 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:onBoardingScreen, page: ()=>const OnBoardingScreen()),
    GetPage(name:signUpScreen, page: ()=>const SignUpScreen()),

  ];



}