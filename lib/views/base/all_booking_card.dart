import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimentions.dart';
import '../../utils/app_icons.dart';
import 'custom_text.dart';
import 'custom_two_button.dart';

class BookingCard extends StatelessWidget {
  final VoidCallback? ontap;
  final String? bookingImage;
  final String? bookingName;
  final String? personName;
  final String? location;
  final String? rating;
  final String? distance;


  const BookingCard({
    super.key,
    this.ontap,
    this.bookingImage,
    this.bookingName,
    this.personName,
    this.location, this.rating, this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r)),
                        child: Image.asset(
                          '$bookingImage',
                          height: 112.h,
                          width: 130.w,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(width: 22.w),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///==========================Rating and Distance Row================================>
                          Row(
                            children: [
                              SingleChildScrollView(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.star,
                                          fit: BoxFit.cover,
                                        ),

                                        ///==================Rating Text===================>
                                        CustomText(
                                            top: 3.h,
                                            text: " $rating",
                                            fontsize: 10.h,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.subTextColor5c5c5c)
                                      ],
                                    ),
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.locationServiceCard,
                                          color: AppColors.primaryColor,
                                        ),

                                        ///======================Distance======================>
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 150),
                                          child: CustomText(
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              text: " $distance",
                                              fontsize: 12.h,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  AppColors.subTextColor5c5c5c),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                          ///========================service name======================>
                          Container(
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: CustomText(
                                text: "serviceName",
                                fontsize: Dimensions.fontSizeDefault.h,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                top: 4.h,
                                bottom: 4.h),
                          ),

                          ///=========================person name=========================>
                          Container(
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.person,
                                  height: 12.h,
                                  color: AppColors.subTextColor5c5c5c,
                                ),
                                Expanded(
                                  child: CustomText(
                                      textAlign: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                      text: " $personName",
                                      fontsize: 12.h,
                                      color: AppColors.subTextColor5c5c5c),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomTwoButon(
                  width: 152.w,
                  btnNameList: ['Cancel', 'Accept'],
                  leftBtnOnTap: () {
                    Get.back();
                  },
                  rightBtnOnTap: () {
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
