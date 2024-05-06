import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

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
