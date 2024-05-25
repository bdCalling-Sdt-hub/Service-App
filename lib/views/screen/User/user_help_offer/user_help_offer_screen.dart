import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_dimentions.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../base/all_booking_card.dart';
import '../../../base/custom_text.dart';

class UserHelpOfferScreen extends StatelessWidget {
   const UserHelpOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Help Offers',
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w,
          vertical: Dimensions.paddingSizeDefault.h),
          child: Column (
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(top: index == 0 ?  10.h : 16.h),
                      child:  GestureDetector(
                        // onTap: (){
                        //   Get.toNamed(AppRoutes.providerBookingDetailsScreen, parameters: {
                        //     "screenType" : "profile"
                        //   });
                        // },
                        child: BookingCard(
                          bookingImage: AppImages.houseKeepingWoman,
                          userName: "Ingredia Nutrisha",
                          serviceName: 'Cleaning',
                          details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit....",
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),


        ),
      ),
    );
  }
}
