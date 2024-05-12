import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/themes/themes.dart';
import 'package:service_app/utils/app_constants.dart';
import 'package:service_app/utils/message.dart';
import 'package:service_app/views/screen/Auth/signUpScreen/sign_up_screen.dart';
import 'package:service_app/views/screen/Profile/booking_request/booking_request_screen.dart';
import 'package:service_app/views/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'controllers/localization_controller.dart';
import 'controllers/theme_controller.dart';
import 'helpers/di.dart' as di;
import 'helpers/route.dart';

void main() async {



  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await di.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(languages: {},), // Wrap your app
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});

  final Map<String, Map<String, String>> languages;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return ScreenUtilInit(
            designSize: const Size(393, 853),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return GetMaterialApp(

                useInheritedMediaQuery: true,
                builder: DevicePreview.appBuilder,



                title: AppConstants.APP_NAME,
                debugShowCheckedModeBanner: false,
                navigatorKey: Get.key,
                theme: Themes().lightTheme,
                darkTheme: Themes().lightTheme,
                defaultTransition: Transition.topLevel,
                locale: localizeController.locale,
                translations: Messages(languages: languages),
                fallbackLocale: Locale(AppConstants.languages[0].languageCode,
                    AppConstants.languages[0].countryCode),
                transitionDuration: const Duration(milliseconds: 500),
                getPages: AppRoutes.page,

                initialRoute: AppRoutes.bottomNavBar,
                home: const BottomNavBar(),

              );
            });
      });
    });
  }
}
