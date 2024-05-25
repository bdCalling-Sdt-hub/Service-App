import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../helpers/route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/all_service_card.dart';
import '../../../base/custom_text.dart';
import '../provider_myhelps/inner_widgets/helps_booking_card.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [

              ///=====================top app bar =================================>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  CustomText(text: "I Help",fontsize: 30.h,fontWeight: FontWeight.w500,color: AppColors.primaryColor,),

                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationScreen);
                    },
                    ///=======================notification bell=======================>
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF4F9EC),
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primaryColor)),
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: Badge(
                            backgroundColor: AppColors.primaryColor,
                            smallSize: 10,
                            child: SvgPicture.asset(
                              AppIcons.notificationBell,
                              height: 26.h,
                              width: 26.w,
                            )),
                      ),
                    ),
                  ),
                ],
              ),


              ///=======================welcome text and location=================>
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                    text: AppString.wellComeEnrique,
                    fontsize: 20.h,
                    fontWeight: FontWeight.w500,
                    bottom: 4.h,
                    top: 29.h),
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
                  CustomText(
                    text: ' New York, USA  ',
                    color: const Color(0xff9DA0A3),
                  ),
                  SvgPicture.asset(AppIcons.dropdown)
                ],
              ),

              SizedBox(
                  height: 20.h
              ),





              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppString.recentBookings,
                    fontsize: 18.h,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.userCategoryScreen);
                    },
                    child: CustomText(
                        text: AppString.seeAll,
                        fontsize: Dimensions.fontSizeDefault.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),


              SizedBox(height: 16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 0 : 16.h),
                      child: ProviderHelpsBookingsCard(
                        ontap: () {
                          Get.toNamed(AppRoutes.providerBookingDetailsScreen);
                        },
                        helpImage: AppImages.helpImage,
                        // selectedBottonItem: selectedIndex,
                        helpName: "House Cleaning",
                        personName: "Jane Cooper",
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
