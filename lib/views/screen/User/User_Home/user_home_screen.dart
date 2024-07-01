import  'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/category_controller.dart';
import 'package:service_app/controllers/home_controller.dart';
import 'package:service_app/controllers/role/user/user_home_controller.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_colors.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/utils/app_images.dart';
import 'package:service_app/utils/app_strings.dart';
import 'package:service_app/views/base/custom_text.dart';

import '../../../base/category_card.dart';
import '../../../base/search_box.dart';
import '../../../base/service_card.dart';


class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {

  final HomeController homeController = Get.put(HomeController());
  final CategoryController _categoryController = Get.put(CategoryController());

  final UserHomeController _homeCtrl=Get.put(UserHomeController());


  int selectedIndex = (-1);

  void setSelectedIndex(int index) {
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ///=====================top app bar =================================>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.appLogo1,
                        height: 48.h, width: 136.w, fit: BoxFit.cover),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.notificationScreen);
                      },
                      ///=======================notification bell=======================>
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffF4F9EC),
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Padding(
                          padding: EdgeInsets.all(6.r),
                          child: Badge(
                              backgroundColor: AppColors.primaryColor,
                              smallSize: 10,
                              child: SvgPicture.asset(
                                AppIcons.notificationBell,
                                height: 32.h,
                                width: 32.w,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),

                ///=======================welcome text and location=================>
                CustomText(
                    text: AppString.wellComeEnrique,
                    fontsize: 20.h,
                    fontWeight: FontWeight.w500,
                    top: 28.h),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.location),
                    CustomText(
                      text: ' New York, USA  ',
                      color: const Color(0xff9DA0A3),
                    ),
                    SvgPicture.asset(AppIcons.dropdown)
                  ],
                ),

                SizedBox(
                  height: 16.h
                ),

                ///===============================search box===========================>

                SearchBox(searchController: homeController.searchController),


                ///===============================Category Section====================>
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppString.categories,
                      fontsize: 18.h,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.userCategoryScreen);
                      },
                      child: CustomText(
                          text: AppString.seeAll,
                          fontsize: Dimensions.fontSizeDefault.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                Container(
                  height: 110.h,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _homeCtrl.categoryModel.value.length,
                      itemBuilder: (context, index) {
                        var categoryInfo = _homeCtrl.categoryModel.value[index];
                        bool isSelected = selectedIndex == index;
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 0 : 13.5.w),
                          child: CategoryCard(
                            onTap: () {
                            },
                            categoriInfo: categoryInfo,

                          ),
                        );
                      },
                    ),
                  ),
                ),

                ///=============================Nearby helps section=======================>
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppString.nearbyHelps,
                      fontsize: 18.h,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.userAllServiceScreen,  parameters: {"screenType" : AppString.nearbyHelps});
                      },
                      child: CustomText(
                          text: AppString.seeAll,
                          fontsize: Dimensions.fontSizeDefault.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                Container(
                  height: 220.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _homeCtrl.nearbyHelpModel.value.length,
                    itemBuilder: (context, index) {
                      var nearbyInfo=_homeCtrl.nearbyHelpModel.value[index];
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 18.w),
                        child:  ServiceCard(
                          onTap: (){
                            Get.toNamed(AppRoutes.userServiceDetailsScreen);
                          },
                          helpInfo: nearbyInfo,

                        ),
                      );
                    },
                  ),
                ),



                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppString.popularHelps,
                      fontsize: 18.h,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.userAllServiceScreen,
                            parameters: {"screenType" : AppString.popularHelps});
                      },
                      child: CustomText(
                          text: AppString.seeAll,
                          fontsize: Dimensions.fontSizeDefault.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),




                // Container(
                //   height: 220.h,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 6,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.only(left: index == 0 ? 0 : 18.w),
                //         child:  ServiceCard(
                //           onTap: (){
                //             Get.toNamed(AppRoutes.userServiceDetailsScreen);
                //           },
                //           distance: "15 km",
                //           personName: "Ingredia Nutrisha ",
                //           serviceName: "House Cleaning ",
                //           reting: "4.8",
                //         ),
                //       );
                //     },
                //   ),
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

