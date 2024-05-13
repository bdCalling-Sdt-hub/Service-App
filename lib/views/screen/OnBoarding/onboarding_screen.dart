import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_images.dart';
import 'package:service_app/utils/app_strings.dart';

import '../../../utils/app_colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AppImages.onboarding,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.topLeft,
                  begin: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0),
                    Color.fromRGBO(17, 24, 39, 0.9),
                    Color.fromRGBO(17, 24, 39, 0.9),
                    Color.fromRGBO(17, 24, 39, 0.9),
                  ],
                  stops: [0.0409, 0.5783, 0.671, 0.7438],
                  transform: GradientRotation(173.37 * 3.1415926535897932 / 180),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(child: Image.asset(AppImages.appLogo1, width: 191.w, height: 68.h)),
                  SizedBox(height: 24.h,),
                  Text(AppString.togetherText,
                      style: TextStyle(
                          color:AppColors.backgroundColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize:16.h),
                      textAlign: TextAlign.center),
                  SizedBox(height: 21.h,),
                  Text(AppString.joinText,
                    style: TextStyle(
                        color:AppColors.backgroundColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      fontSize:14.h),),
                  SizedBox(height: 21.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.signInScreen);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: AppColors.primaryColor,
                            ),

                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                            child:  Text(
                              AppString.buttonUser,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.r),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.signInScreen);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(color: AppColors.primaryColor),
                              color: Colors.transparent,
                            ),

                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                            child:  Text(
                              AppString.buttonProvider,
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 14.h),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), // Adjust opacity as needed
            ),
          ),
        ],
      ),
    );
  }
}
