import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_dimentions.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key,
    required this.image,
    required this.logo,
    required this.title,
    required this.subtitle,
  });

  final String image,logo, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeLarge, vertical: 16.h),
      child: Column(
        children: [
          Image(
            width: Get.width,
            height: Get.height,
            //=======================================> On Boarding Image Section  <==========================================
            image: AssetImage(image),
          ),
          Column(
            children: [
              SizedBox(
                width: 393.w,
                height: 742.h,
                //=======================================> App Logo Section <==========================================
                child: Center(
                    child:
                    Image.asset(logo, width: 168.w, height: 48.h,)),
              ),
            ],
          ),
          //=======================================> Text <==========================================
          Text(title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h,),
          Text(subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}