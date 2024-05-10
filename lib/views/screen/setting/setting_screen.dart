import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/custom_list_tile.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../base/custom_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: CustomText(
          text: AppString.setting,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),



      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w,vertical: Dimensions.paddingSizeDefault.h),
        child: Column(
        children: [

          CustomListTile(
            onTap: (){},
            title: AppString.changePassword,
            prefixIcon: SvgPicture.asset(AppIcons.lock),
            sufixIcon: SvgPicture.asset(AppIcons.arrowRight),

          ),



          CustomListTile(
            onTap: (){},
            title: AppString.changePassword,
            prefixIcon: SvgPicture.asset(AppIcons.lock),
            sufixIcon: SvgPicture.asset(AppIcons.arrowRight),

          ),


          CustomListTile(
            onTap: (){},
            title: AppString.changePassword,
            prefixIcon: SvgPicture.asset(AppIcons.lock),
            sufixIcon: SvgPicture.asset(AppIcons.arrowRight),

          ),


          CustomListTile(
            onTap: (){},
            title: AppString.changePassword,
            prefixIcon: SvgPicture.asset(AppIcons.lock),
            sufixIcon: SvgPicture.asset(AppIcons.arrowRight),

          ),

        ],
        ),
      ),
    );
  }
}
