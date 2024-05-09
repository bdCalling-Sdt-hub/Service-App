import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/category_controller.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_colors.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/utils/app_images.dart';
import 'package:service_app/utils/app_strings.dart';
import 'package:service_app/views/base/custom_text.dart';
import 'package:service_app/views/base/custom_text_field.dart';

import '../../base/category_card.dart';
import '../../base/service_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  final CategoryController _categoryController = Get.put(CategoryController());

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.appLogo1,
                        height: 48.h, width: 136.w, fit: BoxFit.cover),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.notificationScreen);
                      },
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
                CustomText(
                    text: AppString.wellComeEnrique,
                    fontsize: 20.h,
                    fontWeight: FontWeight.w500,
                    top: 28.h),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.location),
                    CustomText(
                      text: '  New York, USA  ',
                      color: const Color(0xff9DA0A3),
                    ),
                    SvgPicture.asset(AppIcons.dropdown)
                  ],
                ),

                SizedBox(
                  height: 16.h,
                ),

                ///===============================search box===========================>
                Container(
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
                          hintText: AppString.searchForYourNearby,
                          controller: searchController,
                          borderColor: const Color(0xffEBEBEB),
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 10.h),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(6.r)),
                                child: Padding(
                                  padding: EdgeInsets.all(12.r),
                                  child: SvgPicture.asset(AppIcons.search),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),


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
                        Get.toNamed(AppRoutes.categoryScreen);
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
                      itemCount: _categoryController.cetegoryList.length,
                      // Use all categories
                      itemBuilder: (context, index) {
                        var category = _categoryController.cetegoryList[index];
                        bool isSelected = selectedIndex == index;
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 0 : 13.5.w),
                          child: CategoryCard(
                            onTap: () {
                              setState(() {
                                setSelectedIndex(index);
                              });
                            },
                            categorIcon: category['categoryIcon'],
                            categorName: category['categoryName'],
                            isSelected: isSelected,
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
                    CustomText(
                        text: AppString.seeAll,
                        fontsize: Dimensions.fontSizeDefault.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor),
                  ],
                ),

                SizedBox(height: 16.h),

                Container(
                  height: 220.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 18.w),
                        child: const ServiceCard(
                          distance: "15 km",
                          personName: "Ingredia Nutrisha dddddddddddddddddddddddddd",
                          serviceName: "House Cleaning dddddddddddddddddd",
                          reting: "4.8",
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
                    CustomText(
                        text: AppString.seeAll,
                        fontsize: Dimensions.fontSizeDefault.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor),
                  ],
                ),

                SizedBox(height: 16.h),




                Container(
                  height: 220.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 18.w),
                        child: const ServiceCard(
                          distance: "15 km",
                          personName: "Ingredia Nutrisha dddddddddddddddddddddddddd",
                          serviceName: "House Cleaning dddddddddddddddddd",
                          reting: "4.8",
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

