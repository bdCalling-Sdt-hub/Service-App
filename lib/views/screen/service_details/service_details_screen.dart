import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/cachanetwork_image.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../base/custom_text.dart';


class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
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
                      SvgPicture.asset(AppIcons.star),
                      CustomText(
                        text: '4.8 ',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.location),
                      CustomText(
                        text: '437 Star St, Los Angeles, USA',
                        fontWeight: FontWeight.w400,
                        fontsize: 12.h,
                        color: AppColors.subTextColor5c5c5c,
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
        
              CustomText(
                  text: 'Provider ',
                  fontWeight: FontWeight.w500,
                  fontsize: 16.h,
                  bottom: 16.h,
                  top: 20.h),
        
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
                        fontsize: 16.h,
                      ),
                    ],
                  ),
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
                  )
                ],
              ),
        
              ///====================about help =========================>
              CustomText(
                  text: 'About Help ',
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
                        child:  const TopReviewsCard(),
                      );
                    },),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}





class TopReviewsCard extends StatefulWidget {
  const TopReviewsCard({super.key});

  @override
  State<TopReviewsCard> createState() => _TopReviewsCardState();
}

class _TopReviewsCardState extends State<TopReviewsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///=====================profile image========================>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 12.w),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CustomNetworkImage(
                    imageUrl: "https://media.licdn.com/dms/image/D5603AQFdl60xoR0NpQ/profile-displayphoto-shrink_800_800/0/1699503758188?e=2147483647&v=beta&t=HT1KNyCH1d5YWMWSkyDIZxY-6N-oi3x6PXD7kUOvKJ8",
                    height: 40.h,
                    width: 40.w,
                  ),
                ),

                ///==========================person name=====================>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Sagor Ahamed',
                      fontWeight: FontWeight.w500,
                    ),

                    ///==========================Star===========================>

                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      unratedColor: const Color(0xffC0C0C0),
                      itemCount: 5,
                      updateOnDrag: true,
                      wrapAlignment: WrapAlignment.start,
                      itemSize: 15.h,
                      itemBuilder: (context, index) {
                        return const Icon(Icons.star,
                            color: Color(0xffFFB701));},
                      onRatingUpdate: (value) {},
                    ),
                  ],
                ),
              ],
            ),

            ///=======================how many time ago=====================>
            Column(
              children: [
                CustomText(
                  text: '1 Month ago',
                  fontWeight: FontWeight.w400,
                  fontsize: 12.h,
                  color: AppColors.subTextColor5c5c5c,
                ),
              ],
            ),
          ],
        ),

        CustomText(
          text:
          "Lorem ipsum dolor sit amet consectetur. Dolor volutpat tellus nunc nulla enim sit. Nunc ut pellentesque aliquet et. Nunc mattis molestie elit malesuada.",
          color: AppColors.subTextColor5c5c5c,
          maxline: 10,
          textAlign: TextAlign.start,
          top: 12.h,
        )
      ],
    );
  }
}
