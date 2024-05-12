import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../base/custom_text.dart';

class MyBookingServiceCard extends StatelessWidget {
  final VoidCallback? ontap;
  final String? serviceImage;
  final int? selectedBottonItem;
  final String? reting;
  final String? distance;
  final String? serviceName;
  final String? personName;

  const MyBookingServiceCard(
      {super.key,
      this.serviceImage,
      this.reting,
      this.distance,
      this.serviceName,
      this.personName,
      this.ontap,
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SizedBox(
            child: Row(
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
                    child: Image.asset(
                      '$serviceImage',
                      height: 112.h,
                      width: 130.w,
                      fit: BoxFit.cover,
                    )),
                SizedBox(width: 24.w),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///========================service name======================>
                      Container(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: CustomText(
                            text: "$serviceName",
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
                            CustomText(
                                textOverflow: TextOverflow.ellipsis,
                                text: " $personName",
                                fontsize: 12.h,
                                color: AppColors.subTextColor5c5c5c),
                          ],
                        ),
                      ),

                      CustomText(
                          textOverflow: TextOverflow.ellipsis,
                          text: " 36.00",
                          fontsize: 16.h,
                          bottom: 15.h,
                          top: 4.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: selectedBottonItem == 0 ? Color(0xffEAF6ED) : selectedBottonItem == 1 ? Color(0xffFFF8E6) : selectedBottonItem == 2 ? Color(0xffFBE9EC) : Colors.black,),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 4.h),
                          child: CustomText(
                              color: selectedBottonItem == 0 ? Color(0xff2BA24C) : selectedBottonItem == 1 ? Color(0xffFFB701) : selectedBottonItem == 2 ? Color(0xffD7263D) : Colors.black,
                              text: selectedBottonItem == 0 ? "Completed" : selectedBottonItem == 1 ? 'Pending' : selectedBottonItem == 2 ? 'Cancelled' : ''
                          ),
                        ),
                      )
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
