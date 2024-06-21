import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_strings.dart';

import '../../../../controllers/auth_controller.dart';
import '../../../../utils/app_icons.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_text.dart';
import '../../../base/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({super.key});
   final _authcontroller = Get.put(AuthController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: Text(
          AppString.password,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 148.h),
              Center(
                  child: SvgPicture.asset(AppIcons.passwordOutlineIcon)),
              SizedBox(height: 42.h),
              //===============================> Text  <===============================
              CustomText(
                text: AppString.forgotText,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 12.h),
              Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //===============================> Email Text-field <===============================
                          SizedBox(height: 12.h),
                          CustomTextField(
                            controller: _authcontroller.forgetEmailTextCtrl,
                            isEmail: true,
                            hintText: AppString.email,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: SvgPicture.asset(AppIcons.mailIcon),
                            ),
                          ),
                          SizedBox(height: 44.h),
                         // ===============================> Button Field <===============================
                          CustomButton(
                              text: AppString.getOTP,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _authcontroller.handleForget();
                                }
                              }),
                          SizedBox(height: 221,),
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
