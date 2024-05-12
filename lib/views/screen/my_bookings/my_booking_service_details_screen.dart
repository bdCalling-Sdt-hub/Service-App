import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/cachanetwork_image.dart';
import 'package:service_app/views/base/custom_button.dart';
import 'package:service_app/views/base/custom_text_field.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../base/custom_text.dart';
import '../../base/custom_two_button.dart';
import '../../base/top_review_card.dart';
import '../service_details/service_details_screen.dart';
import 'Inner_widgets/alart_dialog.dart';

class MyBookignServiceDetailsScreen extends StatefulWidget {
  const MyBookignServiceDetailsScreen({super.key});

  @override
  State<MyBookignServiceDetailsScreen> createState() =>
      _MyBookignServiceDetailsScreenState();
}

class _MyBookignServiceDetailsScreenState
    extends State<MyBookignServiceDetailsScreen> {
  double reting = 0;

  List experienceeRatingServiceList = [
    {"experienceRating": "Experience", "yearRating": "8 Years"},
    {"experienceRating": "Ratings", "yearRating": "1012"},
    {"experienceRating": "Total Service", "yearRating": "550"}
  ];

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
                      Container(
                        margin: EdgeInsets.only(left: 8.w),
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
                  )
                ],
              ),

              SizedBox(height: 14.h),

              ///=========================person and rating========================>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.personIcon,
                        color: AppColors.black767676,
                        height: 15.h,
                        width: 11.5.w,
                        fit: BoxFit.cover,
                      ),
                      CustomText(
                        text: '  Ingredia Nutrisha',
                        fontWeight: FontWeight.w400,
                        color: AppColors.subTextColor5c5c5c,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.star,
                        height: 13.h,
                      ),
                      CustomText(
                        text: ' 4.8 ',
                        fontWeight: FontWeight.w400,
                        color: AppColors.subTextColor5c5c5c,
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 9.h),

              ///=========================location========================>
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppIcons.location,
                      color: AppColors.black767676),
                  CustomText(
                    text: '  437 Star St, Los Angeles, USA',
                    fontWeight: FontWeight.w400,
                    fontsize: 12.h,
                    color: AppColors.subTextColor5c5c5c,
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              ///=================amount text================>
              Row(
                children: [
                  CustomText(
                    text: '\$36.00 ',
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontsize: 20.h,
                  ),
                  CustomText(
                    text: '  (floor price)',
                    color: AppColors.subTextColor5c5c5c,
                    fontsize: 12.h,
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              ///===================Experience Container===================>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  experienceeRatingServiceList.length,
                  (index) => Container(
                      width: 112.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: AppColors.primaryColor)),
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Center(
                          child: Column(
                            children: [
                              CustomText(
                                text:
                                    '${experienceeRatingServiceList[index]['experienceRating']}',
                                fontsize: 12.h,
                              ),
                              CustomText(
                                text:
                                    '${experienceeRatingServiceList[index]['yearRating']}',
                                fontsize: 16.h,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),

              ///====================about help =========================>
              CustomText(
                  text: 'About Provider ',
                  fontWeight: FontWeight.w500,
                  fontsize: 16.h,
                  bottom: 12.h,
                  top: 16.h),

              ///==================about helps all text==============>
              CustomText(
                text:
                    'Etiam vel metus vel nunc tincidunt ornare. Vestibulum ac massa cursus, sagittis leo at, pulvinar elit. Duis quis urna in elit tempus accumsan.',
                fontWeight: FontWeight.w400,
                maxline: 30,
                color: AppColors.subTextColor5c5c5c,
                textAlign: TextAlign.start,
              ),

              ///====================Top Reviews =========================>
              CustomText(
                  text: 'Top Reviews ',
                  fontWeight: FontWeight.w500,
                  fontsize: 16.h,
                  bottom: 12.h,
                  top: 20.h),

              Container(
                height: 139 * 3,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: const TopReviewsCard(),
                    );
                  },
                ),
              ),

              CustomButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 190.h),
                          child: AlartDialog(),
                        );
                      },
                    );
                  },
                  text: "Give Review"),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}



