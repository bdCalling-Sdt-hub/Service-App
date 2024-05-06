import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/utils/app_images.dart';
import 'package:service_app/utils/app_strings.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Image(
                      width: 900.w,
                      height: 765.h,
                        //=======================================> On Boarding Image Section  <==========================================
                        image: AssetImage(AppImages.onboarding),
                    ),
                    // Column(
                    //   children: [
                    //     SizedBox(
                    //       width: 393.w,
                    //       height: 742.h,
                    //       //=======================================> App Logo Section <==========================================
                    //       child: Center(
                    //           child:
                    //           Image.asset(AppImages.appLogo1, width: 168.w, height: 48.h,)),
                    //     ),
                    //   ],
                    // ),
                    Text(AppString.togetherText,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
              )
            ],
          )
        ],
      )




    );
  }
}
