import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/helpers/route.dart';
import '../../../helpers/pref_helpers.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_images.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;

  void startTimer()async{
    var token=await PrefsHelper.getString(AppConstants.bearerToken);
    const Duration(seconds: 3);
    if(token==null){
      Get.toNamed(AppRoutes.onBoardingScreen);
    }
    else{
      Get.toNamed(AppRoutes.providerBottomNavBar);
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
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
