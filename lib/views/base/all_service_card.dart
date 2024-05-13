import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimentions.dart';
import '../../utils/app_icons.dart';
import 'custom_text.dart';

class AllServiceCard extends StatelessWidget {
  final VoidCallback? ontap;
  final String? serviceImage;
  final String? reting;
  final String? distance;
  final String? serviceName;
  final String? personName;
  const AllServiceCard({super.key, this.serviceImage, this.reting, this.distance, this.serviceName, this.personName, this.ontap});

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
                    child: Image.asset('$serviceImage', height: 112.h,width: 130.w,fit: BoxFit.cover,)),
                SizedBox(width: 24.w),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.star,fit: BoxFit.cover,),
                                    ///==================Rating Tex===================>
                                    CustomText(
                                      top: 3.h,
                                        text: " $reting",
                                        fontsize: 10.h,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.subTextColor5c5c5c)
                                  ],
                                ),
                                SizedBox(width: 40.w,),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.locationServiceCard,
                                      color: AppColors.primaryColor,
                                    ),

                                    ///======================Distance======================>
                                    Container(
                                      constraints: const BoxConstraints(maxWidth: 150),
                                      child: CustomText(
                                          textOverflow: TextOverflow.ellipsis,
                                          text: " $distance",
                                          fontsize: 12.h,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.subTextColor5c5c5c),
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
                            SvgPicture.asset(AppIcons.person,height: 12.h,color: AppColors.subTextColor5c5c5c,),
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
          ),
        ),
      ),
    );
  }
}
