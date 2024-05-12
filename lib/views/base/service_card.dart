import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimentions.dart';
import '../../utils/app_icons.dart';
import '../../utils/app_images.dart';
import 'custom_text.dart';

class ServiceCard extends StatelessWidget {
  final String? image;
  final String? reting;
  final String? distance;
  final String? serviceName;
  final String? personName;
  final VoidCallback? onTap;

  const ServiceCard(
      {super.key,
        this.image,
        this.reting,
        this.distance,
        this.serviceName,
        this.onTap,
        this.personName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 202.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.primaryColor)),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
                  child: Image.asset(AppImages.serviceImage,
                      height: 112.h, fit: BoxFit.cover, width: double.infinity)),

              ///========================rating and distance=====================>
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.star,fit: BoxFit.cover,),
                      CustomText(
                          text: " $reting",
                          fontsize: 10.h,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subTextColor5c5c5c)
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.location,
                        color: AppColors.primaryColor,
                      ),
                      CustomText(
                          text: " $distance",
                          fontsize: 12.h,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subTextColor5c5c5c)
                    ],
                  ),
                ],
              ),

              Flexible(
                child: CustomText(
                    text: "$serviceName",
                    fontsize: Dimensions.fontSizeDefault.h,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor2D2F32,
                    top: 4.h,
                    bottom: 4.h),
              ),

              Row(
                children: [
                  SvgPicture.asset(AppIcons.person,height: 12.h,color: AppColors.subTextColor5c5c5c,),
                  Expanded(
                    child: CustomText(
                      textAlign: TextAlign.start,
                        text: "  $personName",
                        fontsize: 12.h,
                        color: AppColors.subTextColor5c5c5c),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}