import 'package:get/get.dart';
import 'package:service_app/views/screen/Auth/forgotPasswordScreen/forgot_pasword.dart';
import 'package:service_app/views/screen/Auth/moreInformationScreen/more_information_screen.dart';
import 'package:service_app/views/screen/Auth/signInScreen/sign_in_screen.dart';
import 'package:service_app/views/screen/Auth/signUpScreen/sign_up_screen.dart';
import 'package:service_app/views/screen/Auth/verifyOTPScreen/verify_otp_screen.dart';


import '../views/screen/Auth/resetpasswordScreen/reset_password_screen.dart';
import '../views/screen/OnBoarding/onboarding_screen.dart';
import '../views/screen/Splash/splash_screen.dart';
import '../views/screen/all_service/all_service_screen.dart';
import '../views/screen/bottom_nav_bar/bottom_nav_bar.dart';
import '../views/screen/category/category_screen.dart';
import '../views/screen/change_password/change_password_screen.dart';
import '../views/screen/message/Inbox_message/chat_screen.dart';
import '../views/screen/notifications/notifications.dart';
import '../views/screen/privacy_policy_all/privacy_policy_all_screen.dart';
import '../views/screen/search/search_screen.dart';
import '../views/screen/service_details/service_details_screen.dart';
import '../views/screen/setting/setting_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String onBoardingScreen="/onBoarding_screen";
  static String signUpScreen="/signup_screen";
  static String bottomNavBar="/bottomNavBar";
  static String notificationScreen="/NotificationScreen";
  static String categoryScreen="/CategoryScreen";
  static String signInScreen="/sign_in_screen";
  static String verifyOTpScreen="/verify_otp_screen";
  static String moreInformationScreen="/more_information_screen";
  static String forgotPasswordScreen="/forgot_password_screen";
  static String resetPasswordScreen="/reset_password_screen";
  static String allServiceScreen="/AllServiceScreen";
  static String scarchScreen="/scarchScreen";
  static String chatScreen="/ChatScreen";
  static String serviceDetailsScreen="/ServiceDetailsScreen";
  static String settingScreen="/SettingScreen";
  static String privacyPolicyAllScreen="/PrivacyPolicyAllScreen";
  static String changePasswordScreen="/ChangePasswordScreen";








 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:onBoardingScreen, page: ()=>const OnBoardingScreen()),
    GetPage(name:signUpScreen, page: ()=>const SignUpScreen()),
    GetPage(name:bottomNavBar, page: ()=>const BottomNavBar()),
    GetPage(name:notificationScreen, page: ()=> NotificationScreen()),
    GetPage(name:categoryScreen, page: ()=> CategoryScreen()),
    GetPage(name:signInScreen, page: ()=> SignInScreen()),
    GetPage(name:verifyOTpScreen, page: ()=> const VerifyOTPScreen()),
    GetPage(name:moreInformationScreen, page: ()=> MoreInformationScreen()),
    GetPage(name:forgotPasswordScreen, page: ()=> ForgotPasswordScreen()),
    GetPage(name:resetPasswordScreen, page: ()=> ResetPasswordScreen()),
    GetPage(name:allServiceScreen, page: ()=> AllServiceScreen()),
    GetPage(name:scarchScreen, page: ()=> ScarchScreen()),
    GetPage(name:chatScreen, page: ()=> ChatScreen()),
    GetPage(name:verifyOTpScreen, page: ()=> const VerifyOTPScreen()),
    GetPage(name:moreInformationScreen, page: ()=> MoreInformationScreen()),
    GetPage(name:allServiceScreen, page: ()=> AllServiceScreen()),
    GetPage(name:scarchScreen, page: ()=> ScarchScreen()),
    GetPage(name:chatScreen, page: ()=> ChatScreen()),
    GetPage(name:serviceDetailsScreen, page: ()=> ServiceDetailsScreen()),
    GetPage(name:settingScreen, page: ()=> SettingScreen()),
    GetPage(name:privacyPolicyAllScreen, page: ()=> PrivacyPolicyAllScreen()),
    GetPage(name:changePasswordScreen, page: ()=> ChangePasswordScreen()),
  ];



}