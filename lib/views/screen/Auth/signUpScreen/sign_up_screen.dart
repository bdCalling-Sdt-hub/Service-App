import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_text.dart';
import 'InnerWidget/textfield_section.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.signup,
          fontsize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,

        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 78.h),
              Center(
                  child: Image.asset(AppImages.appLogo,
                      width: 171.w, height: 49.h)),
              SizedBox(height: 42.h),
              TextfieldSection(),
            ],
          ),
        ),
      ),
    );
  }
}
