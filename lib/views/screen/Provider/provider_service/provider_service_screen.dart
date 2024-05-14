import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_icons.dart';

import '../../../../helpers/route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/all_service_card.dart';
import '../../../base/custom_text.dart';

class ProviderServiceScreen extends StatelessWidget {
  const ProviderServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.helps,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
//===============================> Body Section <===============================
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.aboutServiceScreen);
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          AppIcons.add,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      AppString.addHelp,
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),
            Expanded (
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(top: index == 0 ? 0 : 16.h),
                    child:  AllServiceCard(
                      ontap: (){
                        Get.toNamed(AppRoutes.providerServiceDetailsScreen);
                      },
                      serviceImage: AppImages.serviceImage,
                      reting: "4.8",
                      distance: "15 km",
                      serviceName: 'Cleaning',
                      personName: "Ingredia Nutrisha",
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),

    );
  }
}

