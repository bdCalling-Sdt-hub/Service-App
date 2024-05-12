import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/views/base/all_service_card.dart';
import 'package:service_app/views/base/search_box.dart';

import '../../../controllers/home_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../base/custom_text.dart';
import '../../base/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

   final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: CustomText(
          text: AppString.search,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),


      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w,
              vertical: Dimensions.paddingSizeDefault.h),
          child: Column(
            children: [

              ///=========================Search Box========================>
              SearchBox(searchController: homeController.searchController),


              SizedBox(height: 10.h),


              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(top: index == 0 ?  10.h : 16.h),
                      child:  AllServiceCard(
                        ontap: (){
                          Get.toNamed(AppRoutes.serviceDetailsScreen);
                        },
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
      ),
    );
  }
}
