 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_images.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_strings.dart';
import '../../base/all_service_card.dart';
import '../../base/custom_text.dart';

class AllServiceScreen extends StatelessWidget {
   AllServiceScreen({super.key});

  var parameters = Get.parameters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: '${parameters['screenType']}',
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w,
            vertical: Dimensions.paddingSizeDefault.h),
        child: Column(
          children: [


            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(top: index == 0 ? 0 : 16.h),
                    child: const AllServiceCard(
                      serviceImage: AppImages.serviceImage,
                      reting: "4.8",
                      distance: "15 km",
                      serviceName: 'House Cleaning',
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

