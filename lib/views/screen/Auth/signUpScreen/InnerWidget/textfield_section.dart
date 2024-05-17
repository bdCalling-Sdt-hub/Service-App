import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_colors.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/custom_button.dart';

import '../../../../../helpers/route.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../base/custom_text_field.dart';

class TextfieldSection extends StatelessWidget {

  TextfieldSection({super.key});
  bool isChecked = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //===============================> Full Name Text-field <===============================
                CustomTextField(
                  hintText: AppString.fullName,
                  controller: nameController,
                  prefixIcon:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(AppIcons.personIcon),
                  ),

                ),
                SizedBox(height: 16.h),
                //===============================> Email Text-field <===============================
                CustomTextField(
                  hintText: AppString.email,
                  controller: emailController,
                  isEmail: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(AppIcons.mailIcon),
                  ),
                ),
                SizedBox(height: 16.h),
                //===============================> Phone Number Text-field <===============================
                CustomTextField(
                  hintText: AppString.phoneNumber,
                  controller: phoneController,
                  borderColor: const Color(0xffCEE3A9),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(AppIcons.phoneIcon),
                  ),
                ),
                SizedBox(height: 16.h),
                //===============================> Create Password Text-field <===============================
                CustomTextField(
                  hintText: AppString.createPassword,
                  controller: createPasswordController,
                  borderColor: const Color(0xffCEE3A9),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(AppIcons.lockIcon),
                  ),
                 isPassword: true,
                ),
                SizedBox(height: 16.h),
                //===============================> Re-Enter Password Text-field <===============================
                CustomTextField(
                  hintText: AppString.reEnterPassword,
                  controller: reEnterPasswordController,
                  borderColor: const Color(0xffCEE3A9),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(AppIcons.lockIcon),
                  ),
                  isPassword: true,
                ),
                SizedBox(height: 16.h),
                //===============================> Terms and Conditions Check Box <===============================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 25.h,
                      child: Checkbox(
                        value: true,
                        checkColor: AppColors.whiteF4F9EC,
                        activeColor: Get.theme.primaryColor,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    Expanded(
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: AppString.creatingAccount,
                            style: Theme.of(context).textTheme.bodyMedium),
                        TextSpan(
                            text: AppString.termsConditions,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: AppColors.primaryColor)),
                        TextSpan(
                            text: AppString.and,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                               ),
                        TextSpan(
                            text: AppString.privacyPolicy,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: AppColors.primaryColor))
                      ])),
                    )
                  ],
                ),

                SizedBox(height: 24.h,),
                //===============================> Sign Up Button <===============================
                CustomButton(onTap:(){
                  Get.toNamed(AppRoutes.verifyOTpScreen, parameters: {
                    'screenType' : 'signUpScreen'
                  });

                }, text:AppString.signUp),
                SizedBox(height: 14.h,),
                //===============================> Already have an Account and Sign In <===============================
                Center(
                  child: RichText(
                    text:TextSpan(
                      text: AppString.alreadyAccount,
                      style: const TextStyle(color:Colors.black),
                      children: [
                    TextSpan(
                      text: AppString.signIn,
                      style: TextStyle(color:Get.theme.primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Get.toNamed(AppRoutes.signInScreen);
                      },
                    )
                  ]),),
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
