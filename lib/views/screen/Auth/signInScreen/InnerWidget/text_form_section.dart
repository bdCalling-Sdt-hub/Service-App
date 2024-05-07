import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/app_colors.dart';


class TextFormSection extends StatefulWidget {
  const  TextFormSection({super.key});

  @override
  State<TextFormSection> createState() => _TextFormSectionState();
}

class _TextFormSectionState extends State<TextFormSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  bool isObscures = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 64.h),
              //===============================> Email Text-field <===============================

              SizedBox(height: 16.h),
              //===============================> Password Text-field <===============================

              SizedBox(height: 16.h),


              //===============================> Sign In Button <===============================
              SizedBox(height: 24.h),

              SizedBox(height: 235.h),
              //===============================> Don’t have an account Section <===============================

              SizedBox(height: 24.h),
            ],
          ),
        )
      ],
    );
  }
  //===============================> Custom Icons Method <===============================
  _customIcons(
    String icon,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: SvgPicture.asset(
        icon,
        color: AppColors.primaryColor,
        height: 24.h,
        width: 24.w,
      ),
    );
  }
}
