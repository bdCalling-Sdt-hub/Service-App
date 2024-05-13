import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/cachanetwork_image.dart';
import 'package:service_app/views/screen/User/User_my_bookings/user_my_booking_service_details_screen.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';

import '../../base/custom_button.dart';
import '../../base/custom_text.dart';


class ProviderServiceDetailsScreen extends StatefulWidget {
  const ProviderServiceDetailsScreen({super.key});

  @override
  State<ProviderServiceDetailsScreen> createState() => _ProviderServiceDetailsScreenState();
}

class _ProviderServiceDetailsScreenState extends State<ProviderServiceDetailsScreen> {

  double reting = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.details,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault.w,
              vertical: Dimensions.paddingSizeDefault.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                  child: CustomNetworkImage(
                      imageUrl:
                      'https://i.dailymail.co.uk/1s/2019/08/26/01/17686528-7393969-image-a-51_1566780716617.jpg',
                      height: 164.h,
                      width: double.infinity)),
              SizedBox(height: 8.h),
              ///=========================House Cleaning========================>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: CustomText(
                        text: 'House Cleaning ',
                        fontWeight: FontWeight.w500,
                        fontsize: 20.h,
                      )),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.star,height: 16.h,width: 16.h),
                      CustomText(
                        text: '4.8 ',
                        fontWeight: FontWeight.w400,
                        color: AppColors.subTextColor5c5c5c,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              ///========================user name========================?>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.location,color: AppColors.color9DA0A3,),
                      CustomText(
                        text: ' 437 Star St, Los Angeles, USA',
                        fontWeight: FontWeight.w400,
                        fontsize: 12.h,
                        color: AppColors.color9DA0A3,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.locationServiceCard),
                      CustomText(
                        text: '15 km ',
                        fontWeight: FontWeight.w400,
                        color: AppColors.black767676,
                        fontsize: 12.h,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 17.h),
              ///====================about help =========================>
              CustomText(
                  text: 'Provider',
                  fontWeight: FontWeight.w500,
                  fontsize: 16.h,
                  bottom: 12.h,
                  top: 16.h),
              SizedBox(height: 16.h),

              ///=========================Text========================>

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.personIcon,
                        color: AppColors.black333333,
                        height: 15.h,
                        width: 11.5.w,
                        fit: BoxFit.cover,
                      ),
                      CustomText(
                        text: '  Ingredia Nutrisha',
                        fontWeight: FontWeight.w400,
                        color: AppColors.color9DA0A3,
                        fontsize: 16.h,
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 16.h),
              CustomText(
                  text: 'Help Details',
                  fontWeight: FontWeight.w500,
                  fontsize: 16.h,
                  bottom: 12.h,
                  top: 16.h),
              SizedBox(height: 12.h),
              ///==================about helps all text==============>
              CustomText(
                text:
                'Etiam vel metus vel nunc tincidunt ornare. Vestibulum ac massa cursus, sagittis leo at, pulvinar elit. Duis quis urna in elit tempus accumsan.',
                fontWeight: FontWeight.w400,
                maxline: 30,
                color: AppColors.subTextColor5c5c5c,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 166.h),
              ///====================Edit Button =========================>
              CustomButton(
                  onTap: () {
                    // Get.offAllNamed(AppRoutes.editServiceScreen);
                  },
                  text: AppString.edit),

            ],
          ),
        ),
      ),
    );
  }
}




