import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app/utils/app_colors.dart';

import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_text_field.dart';

class MoreInformationScreen extends StatelessWidget {
   MoreInformationScreen({super.key});

  TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: Text(
          AppString.moreInformation,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24.h),
              Center(
                  child: SvgPicture.asset(AppIcons.uploadPhoto)),
              SizedBox(height: 12.h),
              //===============================> Text  <===============================
           Text(
               AppString.uploadPhoto,
             style: TextStyle(
                 color: AppColors.primaryColor),),
              SizedBox(height: 24.h),
              Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //===============================> Address Text-field <===============================
                            Text(AppString.address,),
                            SizedBox(height: 8.h),
                            CustomTextField(
                              hintText: AppString.enterAddress,
                              controller: addressController,
                            ),
                            SizedBox(height: 16.h),
                            //===============================> Text-field <===============================
                            Text(AppString.uploadLicenseFront,
                              style: TextStyle(
                                  color: AppColors.black333333),),
                            SizedBox(height: 12.h),


                          ],
                        ),
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
