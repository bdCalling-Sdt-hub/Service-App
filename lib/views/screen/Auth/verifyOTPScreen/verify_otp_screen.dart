import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:service_app/utils/app_colors.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/custom_button.dart';

import '../../../../helpers/route.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_text.dart';
import 'InnerWidget/pin_code_field.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: Text(
          AppString.verifyOTP,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.h),
              Center(
                  child: SvgPicture.asset(AppIcons.passwordOutlineIcon)),
              SizedBox(height: 23.h),
              CustomText(
                text: AppString.verifyText,
                fontWeight: FontWeight.w400,
                maxline: 3,
                textAlign: TextAlign.start,
                bottom: 12.h,
              ),
              SizedBox(height: 16.h),
              const CustomPinCodeTextField(),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //===============================> Didn't get the Code Text <=========================
                  CustomText(
                    text: AppString.didntReceive,
                  ),
                  //===============================> Resent Text <=========================
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      text: AppString.resend,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h,),
              //===============================> Verify OTP Button <=========================
              CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.moreInformationScreen);
                  },
                  text: AppString.verifyOTP),
              SizedBox(height: 200.h,)


            ],
          ),
        ),
      ),
    );
  }
}
