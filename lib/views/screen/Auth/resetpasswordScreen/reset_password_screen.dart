import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final TextEditingController setPassController = TextEditingController();
  final TextEditingController conformPassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: Text(
          AppString.resetPassword,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 140.h),
              Center(
                  child: SvgPicture.asset(AppIcons.resetOutlineIcon)),
              SizedBox(height: 19.h),
              Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //===============================> Set New Password Text-field <===============================
                          SizedBox(height: 19.h),
                          CustomTextField(
                            controller: setPassController,
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
                            controller: conformPassController,
                            isPassword: true,
                            hintText: AppString.confirmPassword,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: SvgPicture.asset(AppIcons.lockIcon),
                            ),
                          ),
                          SizedBox(height: 44.h),
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
