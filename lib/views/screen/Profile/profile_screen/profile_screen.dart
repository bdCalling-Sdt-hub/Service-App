import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_colors.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/utils/app_strings.dart';

import '../../../base/custom_list_tile.dart';
import 'inner_widget/top_container_section.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchToProvide= false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
        
        
            const TopProfileCard(),
        
        
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w, vertical: Dimensions.paddingSizeDefault.h),
              child: Column(
                children: [
        
                  CustomListTile(
                    title: AppString.switchToProviderAccount,
                    prefixIcon: SvgPicture.asset(AppIcons.user,  color: AppColors.primaryColor),
                    sufixIcon: GestureDetector(
                      onTap: (){
        
                        setState(() {
                          switchToProvide = !switchToProvide;
                          print("==============================> $switchToProvide");
                        });
        
        
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 18.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.black333333.withOpacity(.20)),
                              borderRadius: BorderRadius.circular(20.r)
                            ),
                          ),
        
                          Positioned(
                            left: switchToProvide ?  null : -1 ,
                            right:  switchToProvide ? -1  :  null,
        
                            child: Container(
                              height: 18.h,
                              width: 20.w,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle
                              ),
                            ),
                          )
        
                        ],
                      ),
                    )
                  ),
        
        
        
        
                  CustomListTile(
                    onTap: (){
                      Get.toNamed(AppRoutes.personalInformation);
                    },
                    title: AppString.personalInformaition,
                    prefixIcon: SvgPicture.asset(AppIcons.user,  color: AppColors.primaryColor),
                  ),
        
        
        
                  CustomListTile(
                    title: AppString.bookingRequest,
                    prefixIcon: SvgPicture.asset(AppIcons.bookingRequest,  color: AppColors.primaryColor),
                  ),
        
        
                  CustomListTile(
                    onTap: (){
                      Get.toNamed(AppRoutes.myBookingsScreen);
                    },
                    title:AppString.myBookings,
                    prefixIcon: SvgPicture.asset(AppIcons.bookingRequest,  color: AppColors.primaryColor),
                  ),
        
        
        
                  CustomListTile(
                    onTap: (){
                      Get.toNamed(AppRoutes.settingScreen);
                    },
                    title: AppString.setting,
                    prefixIcon: SvgPicture.asset(AppIcons.setting,  color: AppColors.primaryColor),
                  ),
        
        
                  CustomListTile(
                    title: AppString.logout,
                    prefixIcon: SvgPicture.asset(AppIcons.setting,  color: AppColors.primaryColor),
                  ),
                ],
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
