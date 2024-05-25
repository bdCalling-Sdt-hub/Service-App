import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/cachanetwork_image.dart';
import 'package:service_app/views/base/custom_button.dart';
import 'package:service_app/views/base/custom_two_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_text.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.bookingDetails,
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


                  Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteF4F9EC,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: Center(
                              child: SvgPicture.asset(AppIcons.message),
                            ),
                          ),
                        ),

                        SizedBox(width: 10.w,),

                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteF4F9EC,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: Center(
                              child: SvgPicture.asset(AppIcons.call2),
                            ),
                          ),
                        )

                      ],
                    ),
                  )

                ],
              ),

              SizedBox(height: 14.h),

              ///========================user name========================?>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.personIcon,
                        color: AppColors.color9DA0A3,
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
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(AppIcons.star,
                  //         height: 16.h, width: 16.h),
                  //     CustomText(
                  //       text: '4.8 ',
                  //       fontWeight: FontWeight.w400,
                  //       color: AppColors.subTextColor5c5c5c,
                  //     ),
                  //   ],
                  // )
                ],
              ),
              SizedBox(height: 8.h),

              ///=========================location========================>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.location,
                        color: AppColors.color9DA0A3,
                      ),
                      CustomText(
                        text: ' 437 Star St, Los Angeles, USA',
                        fontWeight: FontWeight.w400,
                        fontsize: 12.h,
                        color: AppColors.color9DA0A3,
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(AppIcons.locationServiceCard),
                  //     CustomText(
                  //       text: '15 km ',
                  //       fontWeight: FontWeight.w400,
                  //       color: AppColors.black767676,
                  //       fontsize: 12.h,
                  //     ),
                  //   ],
                  // )
                ],
              ),

              CustomText(
                text: "\$36.00",
                fontsize: 20.h,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
                top: 10.h,
              ),

              ///====================about help =========================>
              CustomText(
                  text: 'User Details',
                  fontWeight: FontWeight.w500,
                  fontsize: 20.h,
                  bottom: 16.h,
                  top: 16.h),

              ///============================bottom this Row====================>
              _Row(AppString.userName, 'John Doe'),
              _Row(AppString.service, 'Cleaning'),

              SizedBox(height: 16.h),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppString.status,
                    color: AppColors.subTextColor5c5c5c,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.whiteF4F9EC),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                      child: CustomText(
                          maxline: 4,
                          textAlign: TextAlign.end,
                          text: "Approved",
                          color: AppColors.black333333,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              _Row(AppString.address,
                  '2972 Westheimer Rd. Santa Ana, Illinois 85486 '),
              _Row(AppString.userName, 'John Doe'),
              _Row(AppString.phoneNumber, '+4432101846 '),

              SizedBox(height: 40.h),

              ///===========================Mark As Completed button=====================>
              Get.parameters['screenType'] == "profile" ?
                  CustomTwoButon(
                    leftBtnOnTap: (){Get.back();},
                    width: 165.w,
                    btnNameList: ['Cancel' , 'Accept'],
                  ) :
              CustomButton(onTap: () {}, text: AppString.markAsCompleted)
            ],
          ),
        ),
      ),
    );
  }

  _Row(String tralingText, leadingText) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: "$tralingText",
            color: AppColors.subTextColor5c5c5c,
          ),
          SizedBox(
            width: 204.w,
            child: Flexible(
              child: CustomText(
                  maxline: 4,
                  textAlign: TextAlign.end,
                  text: "$leadingText",
                  color: AppColors.black333333,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
