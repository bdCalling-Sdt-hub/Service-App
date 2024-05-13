import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimentions.dart';
import '../../utils/app_icons.dart';
import 'custom_text.dart';
import 'custom_two_button.dart';

class AllBookingCard extends StatelessWidget {
  final VoidCallback? ontap;
  final String? bookingImage;
  final String? bookingName;
  final String? personName;
  final String? location;
  final String? dollar;

   AllBookingCard({super.key,
    this.ontap,
    this.bookingImage,
    this.bookingName,
    this.personName,
    this.location,
    this.dollar,});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SizedBox(
            child: Row(
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                    child: Image.asset('$bookingImage',
                      height: 112.h,
                      width: 130.w,
                      fit: BoxFit.cover,)),
                SizedBox(width: 22.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///=========================person name=========================>
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.person,
                          height: 12.h,color: AppColors.subTextColor5c5c5c,),
                        CustomText(
                            textOverflow: TextOverflow.ellipsis,
                            text: " $personName",
                            fontsize: 12.h,
                            color: AppColors.subTextColor5c5c5c),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    ///========================booking name======================>
                    CustomText(
                        text: "$bookingName",
                        fontsize: Dimensions.fontSizeDefault.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        top: 4.h,
                        bottom: 4.h),
                    const SizedBox(height: 8,),
                    ///========================location Text======================>
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.location,
                          height: 10.h,
                          color: AppColors.subTextColor5c5c5c,),
                        CustomText(
                            textOverflow: TextOverflow.ellipsis,
                            text: " $location",
                            fontsize: 10.h,
                            color: AppColors.subTextColor5c5c5c),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ///==================Dollar text===================>
                            CustomText(
                                text: " $dollar",
                                fontsize: 20.h,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor)
                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 16.h,),
                    const CustomTwoButon(
                      btnNameList: ['Cancel', 'Accept'],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),


    );

  }
}
