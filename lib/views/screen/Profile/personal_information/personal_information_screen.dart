import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/views/base/custom_text.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../base/custom_list_tile.dart';
import 'inner_widget/top_section.dart';



class PersonalInformation extends StatelessWidget {
  PersonalInformation({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,

      appBar: AppBar(
        title: CustomText(
          text: "Personal Information",
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            //==================================> TopContainer Section <=================================
            TopSection(
                ontap: () {

                }),
            SizedBox(height: 24.h),
            //==================================> CustomContainer Section <=================================



            //=================================> Profile Name <==========================
            CustomListTile(
                title: 'Jane Cooper',
                prefixIcon: _prefixIcon(AppIcons.person)),


            //=================================> Profile Email <==========================
            CustomListTile(
                title: 'sagorahamed@gmail.com',
                prefixIcon: _prefixIcon(AppIcons.email)),


            //=================================> Phone Number <==========================
            CustomListTile(
                title:'(000) 000-0000',
                prefixIcon: _prefixIcon(
                  AppIcons.call,
                )),



            CustomListTile(
                title:'Banasree, Rampura, Dhaka, Bangladesh',
                prefixIcon: _prefixIcon(
                  AppIcons.locationss,
                )),

          ],
        ),
      ),
    );
  }

  _prefixIcon(String icon) {
    return SvgPicture.asset(icon, color: AppColors.primaryColor);
  }
}