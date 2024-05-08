import 'package:get/get.dart';
import 'package:service_app/views/screen/Auth/signUpScreen/sign_up_screen.dart';

import '../views/screen/OnBoarding/onboarding_screen.dart';
import '../views/screen/Splash/splash_screen.dart';
import '../views/screen/bottom_nav_bar/bottom_nav_bar.dart';
import '../views/screen/notifications/notifications.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String onBoardingScreen="/onBoarding_screen";
  static String signUpScreen="/signup_screen";
  static String bottomNavBar="/bottomNavBar";
  static String notificationScreen="/NotificationScreen";

 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:onBoardingScreen, page: ()=>const OnBoardingScreen()),
    GetPage(name:signUpScreen, page: ()=>const SignUpScreen()),
    GetPage(name:bottomNavBar, page: ()=>const BottomNavBar()),
    GetPage(name:notificationScreen, page: ()=> NotificationScreen()),

  ];



}