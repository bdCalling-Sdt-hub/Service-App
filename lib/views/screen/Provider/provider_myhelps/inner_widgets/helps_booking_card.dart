import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/services/api_constants.dart';
import 'package:service_app/views/base/cachanetwork_image.dart';

import '../../../../../models/recent_booking_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../base/custom_text.dart';


class ProviderHelpsBookingsCard extends StatelessWidget {
  final VoidCallback? ontap;
  final String? helpImage;
  final int? selectedBottonItem;
  final String? reting;
  final String? distance;
  final String? helpName;
  final String? personName;

  final RecentBookingModel bookingInfo;

  const ProviderHelpsBookingsCard(
      {super.key,
        this.helpImage,
        this.reting,
        this.distance,
        this.helpName,
        this.personName,
        this.ontap,
        required this.bookingInfo,
        this.selectedBottonItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 12.h),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNetworkImage(
                  imageUrl:"${ApiConstants.imageBaseUrl}${bookingInfo.serviceId!.servicePhoto![0].publicFileUrl}",
                  height: 98.h,
                  width: 98.w,
                  boxShape: BoxShape.circle,

                ),
                SizedBox(width: 12.w),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///========================person name======================>

                      Container(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: CustomText(
                            text: bookingInfo.provider!.name.toString(),
                            fontsize: 14.h,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black333333,
                            top: 4.h,
                            bottom: 4.h),
                      ),

                      ///=========================help name=========================>
                      Container(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: CustomText(
                            text: bookingInfo.selectHelp.toString(),
                            fontsize: 16.h,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black333333,
                            top: 4.h,
                            bottom: 4.h),
                      ),
                      ///=========================Text=========================>
                      Container(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: CustomText(
                            text: bookingInfo.helpDescription.toString(),
                            fontsize: 10.h,
                            fontWeight: FontWeight.w400,
                            color: AppColors.subTextColor5c5c5c,
                            textAlign: TextAlign.start,
                            maxline: 2,
                            top: 4.h,
                            bottom: 4.h),
                      ),
                      SizedBox(height: 10.h,),

                      // CustomText(
                      //     textOverflow: TextOverflow.ellipsis,
                      //     text: "\$36.00",
                      //     fontsize: 20.h,
                      //     bottom: 15.h,
                      //     top: 4.h,
                      //     fontWeight: FontWeight.w500,
                      //     color: AppColors.primaryColor),

                      selectedBottonItem== null ? SizedBox() :
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: selectedBottonItem == 0 ? const Color(0xffEAF6ED) : selectedBottonItem == 1 ? const Color(0xffFFF8E6) : selectedBottonItem == 2 ? const Color(0xffFBE9EC) : Colors.black,),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 46.w, vertical: 4.h),
                          child: CustomText(
                              color: selectedBottonItem == 0 ? const Color(0xff2BA24C) : selectedBottonItem == 1 ? const Color(0xffFFB701) : selectedBottonItem == 2 ? const Color(0xffD7263D) : Colors.black,
                              text: selectedBottonItem == 0 ? "Complete" : selectedBottonItem == 1 ? 'Pending' : selectedBottonItem == 2 ? 'Cancelled' : ''
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
