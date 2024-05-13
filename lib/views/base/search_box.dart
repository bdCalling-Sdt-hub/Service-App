
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helpers/route.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/app_strings.dart';
import 'custom_text.dart';
import 'custom_text_field.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController searchController;
  const SearchBox({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return                 Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColorcee3a9),
          borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding:
        EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: AppString.whatYouAreLooking,
                bottom: 8.h,
                fontsize: 16.h,
                fontWeight: FontWeight.w500),
            CustomTextField(
              hintextSize: 14.h,
              hintextColor: AppColors.hintextColorA1A1A1,
              hintText: AppString.searchForYourNearby,
              controller: searchController,
              borderColor: const Color(0xffEBEBEB),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 12.w, vertical: 10.h),

                ///===========================Go to Search Screen when user Check Search Icon======================>
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.userSearchScreen);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: SvgPicture.asset(AppIcons.search),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
