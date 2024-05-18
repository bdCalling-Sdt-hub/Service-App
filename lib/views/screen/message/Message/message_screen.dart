import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_images.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_text.dart';

class MessageScreen extends StatelessWidget {
   MessageScreen({super.key});



   List userList = [
     {
       "image": AppImages.onboarding,
       'name': "Sagor Ahamed",
     },
     {
       "image": AppImages.onboarding,
       'name': "Swapon",
     },
     {
       "image": AppImages.onboarding,
       'name': "Palash",
     },
     {
       "image": AppImages.onboarding,
       'name': "Towhidul Islam",
     },
     {
       "image": AppImages.onboarding,
       'name': "Sahinur",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
     {
       "image": AppImages.onboarding,
       'name': "Other name",
     },
   ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: CustomText(
          text: AppString.messages,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w,
            vertical: Dimensions.paddingSizeDefault.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  var user = userList[index];
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.chatScreen, parameters: {"userName" : user['name']});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: AppColors.whiteF4F9EC,
                          borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 38.h,
                                  width: 38.w,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),

                                  child: Image.asset(AppImages.serviceImage,fit: BoxFit.cover,),
                                ),


                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 13.h,
                                    width: 13.w,
                                    clipBehavior: Clip.antiAlias,
                                    decoration:  BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                       border: Border.all(color: AppColors.whiteF4F9EC,width: 1.5.r),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF34DE00),
                                          Color(0xFF229400),
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "${user["name"]}",
                                  fontsize: 16.h,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  top: 4.h,
                                  text: "Hello, are you here?",
                                  fontsize: 12.h,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black767676,
                                )

                              ],
                            ),

                          ],
                        ),
                      ),
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
