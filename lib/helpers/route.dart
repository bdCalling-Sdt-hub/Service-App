import 'package:get/get.dart';
import 'package:service_app/views/screen/Auth/forgotPasswordScreen/forgot_pasword.dart';
import 'package:service_app/views/screen/Auth/moreInformationScreen/more_information_screen.dart';
import 'package:service_app/views/screen/Auth/signInScreen/sign_in_screen.dart';
import 'package:service_app/views/screen/Auth/signUpScreen/sign_up_screen.dart';
import 'package:service_app/views/screen/Auth/verifyOTPScreen/verify_otp_screen.dart';
import 'package:service_app/views/screen/Profile/profile_screen/profile_screen.dart';
import 'package:service_app/views/screen/Provider/Wallet/wallet_screen.dart';
import 'package:service_app/views/screen/Provider/provider_home/provider_home_screen.dart';
import 'package:service_app/views/screen/Provider/provider_service/add_new_service.dart';
import 'package:service_app/views/screen/Provider/provider_service/provider_service_screen.dart';
import 'package:service_app/views/screen/Provider/reviews/review_screen.dart';
import 'package:service_app/views/screen/Provider/wallet/wallet_withdrawal_screen.dart';
import 'package:service_app/views/screen/User/All_nearby_help_screen/all_nearby_help_screen.dart';
import 'package:service_app/views/screen/User/all_popular_help_screen/all_popular_help_screen.dart';
import 'package:service_app/views/screen/message/send_offer_screen.dart';
import '../views/screen/Auth/resetpasswordScreen/reset_password_screen.dart';
import '../views/screen/OnBoarding/onboarding_screen.dart';
import '../views/screen/Profile/edit_profile/edit_profile_screen.dart';
import '../views/screen/Profile/personal_information/personal_information_screen.dart';
import '../views/screen/Provider/provider_home/provider_booking_details_screen.dart';
import '../views/screen/Provider/provider_bottm_nav_bar/provider_bottom_nav_bar.dart';
import '../views/screen/Provider/provider_myhelps/provider_myhelps_screen.dart';
import '../views/screen/Provider/provider_service/edit_service_screen.dart';
import '../views/screen/Provider/provider_service/provider_service_details_screen.dart';
import '../views/screen/Splash/splash_screen.dart';
import '../views/screen/User/User_bottom_nav_bar/user_bottom_nav_bar.dart';
import '../views/screen/User/User_my_bookings/user_my_booking_service_details_screen.dart';
import '../views/screen/User/User_my_bookings/user_my_bookings_screen.dart';
import '../views/screen/User/user_all_service/user_all_service_screen.dart';
import '../views/screen/User/user_category/user_category_screen.dart';
import '../views/screen/User/user_help_offer/user_help_offer_screen.dart';
import '../views/screen/User/user_search/user_search_screen.dart';
import '../views/screen/User/user_service_details/user_service_details_screen.dart';
import '../views/screen/change_password/change_password_screen.dart';
import '../views/screen/message/chat_screen/chat_screen.dart';
import '../views/screen/notifications/notifications.dart';
import '../views/screen/privacy_policy_all/privacy_policy_all_screen.dart';
import '../views/screen/setting/setting_screen.dart';


class AppRoutes{
  static String splashScreen="/splash_screen";
  static String profileScreen="/profile_screen";
  static String onBoardingScreen="/onBoarding_screen";
  static String signUpScreen="/signup_screen";
  static String userBottomNavBar="/UserBottomNavBar";
  static String notificationScreen="/NotificationScreen";
  static String userCategoryScreen="/UserCategoryScreen";
  static String signInScreen="/sign_in_screen";
  static String verifyOTpScreen="/verify_otp_screen";
  static String moreInformationScreen="/more_information_screen";
  static String forgotPasswordScreen="/forgot_password_screen";
  static String resetPasswordScreen="/reset_password_screen";
  static String userAllServiceScreen="/UserAllServiceScreen";
  static String userSearchScreen="/UserSearchScreen";
  static String chatScreen="/ChatScreen";
  static String userServiceDetailsScreen="/UserServiceDetailsScreen";
  static String providerServiceDetailsScreen="/ProviderServiceDetailsScreen";
  static String settingScreen="/SettingScreen";
  static String privacyPolicyAllScreen="/PrivacyPolicyAllScreen";
  static String changePasswordScreen="/ChangePasswordScreen";
  static String personalInformation="/PersonalInformation";

  static String aboutServiceScreen="/AboutServiceScreen";
  static String editServiceScreen="/EditServiceScreen";
  static String reviewScreen="/ReviewScreen";
  static String walletScreen="/WalletScreen";
  static String myHelps="/My Helps";
   static String userHelpOfferScreen="/UserHelpOfferScreen";
  static String editProfileScreen="/EditProfileScreen";
  static String userMyBookingsScreen="/UserMyBookingsScreen";
  static String userMyBookignServiceDetailsScreen="/UserMyBookignServiceDetailsScreen";
  static String allNearbayScreen="/allNearbyScreen";
  static String allpopulerScreen="/allPopularHelpScreen";



  ///provider======>
  static String providerBottomNavBar="/ProviderBottomNavBar";
  static String providerHomeScreen="/ProviderHomeScreen";
  static String providerBookingDetailsScreen="/ProviderBookingDetailsScreen";
  static String providerServiceScreen="/ProviderServiceScreen";
  static String walletWithdrawalScreen="/WalletWithdrawalScreen";
  static String providerhelpsScreen="/ProviderHelpsScreen";
  static String sendOfferScreen="/SendOfferScreen";




 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=> SplashScreen()),
    GetPage(name:profileScreen, page: ()=> ProfileScreen()),
    GetPage(name:onBoardingScreen, page: ()=>const OnBoardingScreen()),
    GetPage(name:signUpScreen, page: ()=> SignUpScreen()),
    GetPage(name:userBottomNavBar, page: ()=>const UserBottomNavBar()),
    GetPage(name:notificationScreen, page: ()=> NotificationScreen()),
    GetPage(name:userCategoryScreen, page: ()=> UserCategoryScreen()),
    GetPage(name:signInScreen, page: ()=> SignInScreen()),
    GetPage(name:verifyOTpScreen, page: ()=> const VerifyOTPScreen()),
    GetPage(name:moreInformationScreen, page: ()=> MoreInformationScreen()),
    GetPage(name:forgotPasswordScreen, page: ()=> ForgotPasswordScreen()),
    GetPage(name:resetPasswordScreen, page: ()=> ResetPasswordScreen()),
    GetPage(name:userAllServiceScreen, page: ()=> UserAllServiceScreen()),
    GetPage(name:userSearchScreen, page: ()=> UserSearchScreen()),
    GetPage(name:chatScreen, page: ()=> ChatScreen()),
    GetPage(name:verifyOTpScreen, page: ()=> const VerifyOTPScreen()),
    GetPage(name:moreInformationScreen, page: ()=> MoreInformationScreen()),
    GetPage(name:userServiceDetailsScreen, page: ()=> UserServiceDetailsScreen()),
    GetPage(name:providerServiceDetailsScreen, page: ()=> ProviderServiceDetailsScreen()),
    GetPage(name:settingScreen, page: ()=> SettingScreen()),
    GetPage(name:privacyPolicyAllScreen, page: ()=> PrivacyPolicyAllScreen()),
    GetPage(name:changePasswordScreen, page: ()=> ChangePasswordScreen()),
    GetPage(name:personalInformation, page: ()=> PersonalInformation()),
    GetPage(name:aboutServiceScreen, page: ()=> AddServiceScreen()),
    GetPage(name:editServiceScreen, page: ()=> EditServiceScreen()),
    GetPage(name:reviewScreen, page: ()=> ReviewScreen()),
    GetPage(name:walletScreen, page: ()=> WalletScreen()),
    GetPage(name:walletWithdrawalScreen, page: ()=> WalletWithdrawalScreen()),
    GetPage(name:allNearbayScreen, page: ()=> AllNearbyScreen()),
    GetPage(name:allpopulerScreen, page: ()=> AllPopularHelpScreen()),


    GetPage(name:userHelpOfferScreen, page: ()=> UserHelpOfferScreen()),

    GetPage(name:editProfileScreen, page: ()=> EditProfileScreen()),
    GetPage(name:userMyBookingsScreen, page: ()=> UserMyBookingsScreen()),
    GetPage(name:userMyBookignServiceDetailsScreen, page: ()=> UserMyBookignServiceDetailsScreen()),
    GetPage(name:providerBottomNavBar, page: ()=> ProviderBottomNavBar()),
    GetPage(name:providerBookingDetailsScreen, page: ()=> ProviderBookingDetailsScreen()),
    GetPage(name:providerServiceScreen, page: ()=> ProviderServiceScreen()),
    GetPage(name:providerhelpsScreen, page: ()=> ProviderHelpsScreen()),
    GetPage(name:sendOfferScreen, page: ()=> SendOfferScreen()),
    GetPage(name:providerHomeScreen, page: ()=> ProviderHomeScreen()),

  ];



}