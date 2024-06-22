import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_app/helpers/route.dart';

import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../utils/app_colors.dart';
import '../../base/custom_button.dart';
import '../../base/custom_text.dart';
import '../../base/custom_text_field.dart';


class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});


  final TextEditingController oldPassWordController = TextEditingController();
  final TextEditingController setPasswordController = TextEditingController();
  final TextEditingController conformPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.changePassword,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 19.h),
                          CustomTextField(
                            controller: oldPassWordController,
                            borderColor: AppColors.borderColorcee3a9,
                            isPassword: true,
                            hintText: AppString.oldPassword,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: SvgPicture.asset(AppIcons.lockIcon),
                            ),
                          ),




                          //===============================> Set New Password Text-field <===============================
                          SizedBox(height: 19.h),
                          CustomTextField(
                            controller: setPasswordController,
                            borderColor: AppColors.borderColorcee3a9,
                            isPassword: true,
                            hintText: AppString.setNewPassword,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: SvgPicture.asset(AppIcons.lockIcon),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          //===============================> Conform Password Text-field <===============================
                          CustomTextField(
                            controller: conformPasswordController,
                            borderColor: AppColors.borderColorcee3a9,
                            isPassword: true,
                            hintText: AppString.confirmPassword,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: SvgPicture.asset(AppIcons.lockIcon),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.forgotPasswordScreen);
                            },
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: CustomText(text: AppString.forgotPassword, color: AppColors.primaryColor, fontWeight: FontWeight.w600,fontsize: 16.h,top: 16.h)),
                          ),


                          SizedBox(height: 290.h),
                          // ===============================> Conform Password Button <===============================
                          CustomButton(
                              onTap: () {

                              },
                              text: AppString.resetPassword),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
