import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
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

