import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app/utils/app_icons.dart';

import '../../../../../utils/app_strings.dart';
import '../../../../base/custom_text_field.dart';

class TextfieldSection extends StatelessWidget {
  TextfieldSection({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding:
            EdgeInsets.symmetric(vertical: 16.h, horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: AppString.fullName,
                  controller: nameController,
                  borderColor:  const Color(0xffCEE3A9),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Padding(
                          padding:  EdgeInsets.all(12.r),
                          child: SvgPicture.asset(AppIcons.personIcon),
                        )),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your full name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: AppString.email,
                  controller: emailController,
                  borderColor:  const Color(0xffCEE3A9),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Padding(
                          padding:  EdgeInsets.all(12.r),
                          child: SvgPicture.asset(AppIcons.mailIcon),
                        )),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: AppString.phoneNumber,
                  controller: phoneController,
                  borderColor:  const Color(0xffCEE3A9),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Padding(
                          padding:  EdgeInsets.all(12.r),
                          child: SvgPicture.asset(AppIcons.phoneIcon),
                        )),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: AppString.createPassword,
                  controller: createPasswordController,
                  borderColor:  const Color(0xffCEE3A9),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Padding(
                          padding:  EdgeInsets.all(12.r),
                          child: SvgPicture.asset(AppIcons.lockIcon),
                        )),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: SvgPicture.asset(
                        AppIcons.eyeIcon,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),

                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: AppString.reEnterPassword,
                  controller: reEnterPasswordController,
                  borderColor:  const Color(0xffCEE3A9),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Padding(
                          padding:  EdgeInsets.all(12.r),
                          child: SvgPicture.asset(AppIcons.lockIcon),
                        )),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: SvgPicture.asset(
                        AppIcons.eyeIcon,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),

                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}










