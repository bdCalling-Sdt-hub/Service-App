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
  final String? serviceName;
  final String? userName;
  final String? details;

  const BookingCard(
      {super.key,
      this.ontap,
      this.bookingImage,
      this.serviceName,
      this.userName,
      this.details});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: ontap,
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
                        decoration: const BoxDecoration(
                        shape: BoxShape.circle
                        ),
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
                          Container(
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: CustomText(
                                text: "$userName",
                                fontsize: Dimensions.fontSizeDefault.h,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                top: 4.h,
                                bottom: 4.h),
                          ),

                          ///========================service name======================>
                          Container(
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: CustomText(
                                text: "$serviceName",
                                fontsize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                top: 4.h,
                                bottom: 4.h),
                          ),

                          ///=========================details =========================>
                          Container(
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: Expanded(
                              child: CustomText(
                                  textAlign: TextAlign.start,
                                  textOverflow: TextOverflow.ellipsis,
                                  text: "$details",
                                  fontsize: 12.h,
                                  maxline: 2,
                                  color: AppColors.subTextColor5c5c5c),
                            ),
                          ),

                          Container(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Expanded(
                              child: CustomText(
                                  top: 4.h,
                                  textAlign: TextAlign.start,
                                  text: "36.00",
                                  fontWeight: FontWeight.w600,
                                  fontsize: 20.h,
                                  color: AppColors.primaryColor),
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
                  btnNameList: const ['Cancel', 'Accept'],
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
