import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_colors.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/custom_button.dart';

import '../../../../controllers/auth_controller.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_text.dart';
import 'InnerWidget/pin_code_field.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

  var prameters = Get.parameters;
  final _authCtrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    print("=================${prameters["email"]} and ${prameters["screenType"]}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: Text(
          AppString.verifyOTP,
        ),
      ),
      //===============================> Body Section <===============================
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //=================================> PasswordOutline Section <===============================
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
              //=================================> PinCodeField Section <===============================
              SizedBox(height: 16.h),
               CustomPinCodeTextField(otpCTE: _authCtrl.otpCtrl,),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //===============================> Didn't get the Code Text <=========================
                  CustomText(
                    text: AppString.didntReceive,
                  ),
                  //===============================> Resend Text <=========================
                  InkWell(
                    onTap: () {
                      _authCtrl.resendOtp("${prameters["email"]}");
                      _authCtrl.otpCtrl.clear();
                    },
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
                  loading: _authCtrl.verifyLoading.value,
                  text: AppString.verifyOTP,
                  onTap: () {
                if (_authCtrl.otpCtrl.text.length > 5) {
                  _authCtrl.handleOtpVery(email: "${prameters["email"]}", otp: _authCtrl.otpCtrl.text, type: "${prameters["screenType"]}");
                }

              }
              ),
              SizedBox(height: 170.h,)

            ],
          ),
        ),
      ),
    );
  }
}
