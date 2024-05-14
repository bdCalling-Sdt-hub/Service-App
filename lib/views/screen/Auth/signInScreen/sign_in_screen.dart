import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/custom_button.dart';
import 'package:service_app/views/base/custom_text_field.dart';
import '../../../../helpers/route.dart';
import '../../../../utils/app_strings.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: Text(
          AppString.signIn,
        ),
      ),
      //===============================> Body Section <===============================
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 114.h),
              Center(
                  child: SvgPicture.asset(
                AppIcons.logoIcon,height: 54.h, width: 164.w,fit: BoxFit.cover,)
              ),
              //=================================> Text-field Section <===============================
              SizedBox(height: 56.h),
              CustomTextField(
                controller: _emailCtrl,
                isEmail: true,
                hintText: AppString.email,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SvgPicture.asset(AppIcons.mailIcon),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                controller: _passCtrl,
                isPassword: true,
                hintText: AppString.password,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SvgPicture.asset(AppIcons.lockIcon,height: 24.h,width: 24.w,fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.forgotPasswordScreen);
                    },
                    child: Text(AppString.forgotPassword)),
              ),
              SizedBox(
                height: 24.h,
              ),
              /// <-0------------------------- Sign in button ------------------>
              CustomButton(onTap: () {
                Get.offAllNamed(AppRoutes.providerBottomNavBar);
              }, text: AppString.signIn),
        
             SizedBox(height: 209.h),
              Center(
                child: RichText(
                  text: TextSpan(text: AppString.dontHaveAccount,
                      style: const TextStyle(color: Colors.black),
                      children: [
        
        
                    TextSpan(
                      text: AppString.signUp,
                      style: TextStyle(color: Get.theme.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.signUpScreen);
                        },
                    )
                  ]),
                ),
              ),
              SizedBox(height: 25.h),
        
            ],
          ),
        ),
      ),
    );
  }
}
