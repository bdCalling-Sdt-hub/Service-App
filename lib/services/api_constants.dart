class ApiConstants{
  static const String baseUrl = "http://192.168.10.155:4040/api/v1";
  static const String imageBaseUrl = "http://192.168.10.155:4040";

  static String signUpEndPoint = "/users/sign-up";
  static String otpVerifyEndPoint = "/users/verify";
  static String forgotEndPoint = "/users/resendOtp";
  static String updateProfileEndPoint = "/users/createAccountByimage";
  static const String signInEndPoint = "/users/signIn";
  static const String forgotPasswordEndPoint = "/users/forgotPassword";
  static const String resetPasswordEndPoint = "/users/cahngePassword";
  static const String showBookingEndPoint = "/offer/showOfferBooking";
  static const String recentBookingEndPoint = "/offer/recentBooking";
  static const String bookingDetailsEndPoint = "/offer/bookingDetails?id=667652a23835810430581cfc";
  static const String completeWorkEndPoint = "/offer/completeWork?id=667652883835810430581cfa";
  static const String providerHelpEndPoint = "/service/getallServices";


  /// User Api
  static const String userAllCategoryEndPoint = "/admin/showAllcategory";
  static const String userNearbyHelpEndPoint = "/service/showTheNearbyServices";
  static const String userpopulerHelpEndPoint = "/service/populerServices";


}