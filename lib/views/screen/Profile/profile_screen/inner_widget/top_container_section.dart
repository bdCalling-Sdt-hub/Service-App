import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_icons.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../../utils/app_images.dart';
import '../../../../base/custom_text.dart';

class TopProfileCard extends StatelessWidget {
  final String? profileName;
  final String? profileUrl;
  final double? height;
  final String? badge;

  const TopProfileCard(
      {super.key, this.profileName, this.profileUrl, this.height, this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 328.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border:  Border(
              bottom: BorderSide(color: AppColors.primaryColor, width: 1.80)),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r),
          )),
      child: Column(
        children: [
          CustomText(
            text: AppString.profile,
            fontsize: 18.h,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            bottom: 44.h,
            top: 65.h,
          ),
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor)),

            ///------------------image------------------>
            child: profileUrl == null
                ? const CircleAvatar(
              backgroundImage: AssetImage(AppImages.serviceImage),
            )
                : CircleAvatar(
              backgroundImage:
              NetworkImage("https://media.licdn.com/dms/image/D5603AQFdl60xoR0NpQ/profile-displayphoto-shrink_800_800/0/1699503758188?e=2147483647&v=beta&t=HT1KNyCH1d5YWMWSkyDIZxY-6N-oi3x6PXD7kUOvKJ8"),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Sagor Ahamed" ?? "",
                  fontsize: 20.h,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  // top: 5.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}