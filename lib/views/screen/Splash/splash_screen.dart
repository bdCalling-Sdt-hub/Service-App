
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/helpers/route.dart';
import '../../../utils/app_images.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer; // Declare a Timer variable

  void startTimer() {
    _timer = Timer(Duration(seconds: 3), () {
      // Callback function to execute after 3 seconds
      Get.toNamed(AppRoutes.onBoardingScreen); // Navigate to signInScreen
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when the widget is initialized
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffDEECC5),
      body: Column(
        children: [
          SizedBox(
            width: 393.w,
            height: 742.h,
            //=======================================> App Logo Section <==========================================
            child: Center(
                child:
                Image.asset(AppImages.appLogo, width: 168.w, height: 48.h,)),
          ),
        ],
      ),
    );
  }
}
