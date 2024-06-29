import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/show_booking_controller.dart';
import '../../../../helpers/route.dart';
import '../../../../models/show_booking_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_page_loading.dart';
import '../../../base/custom_text.dart';
import '../provider_myhelps/inner_widgets/helps_booking_card.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  final ShowBookingController showBookingController = Get.put(ShowBookingController());

  @override
  void initState() {
    super.initState();
    showBookingController.showGetGroupList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              // Top App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "I Help",
                    fontsize: 30.h,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF4F9EC),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: Badge(
                          backgroundColor: AppColors.primaryColor,
                          smallSize: 10,
                          child: SvgPicture.asset(
                            AppIcons.notificationBell,
                            height: 26.h,
                            width: 26.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Welcome Text and Location Dropdown
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: AppString.wellComeEnrique,
                  fontsize: 20.h,
                  fontWeight: FontWeight.w500,
                  bottom: 4.h,
                  top: 29.h,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.location),
          Obx(() => DropdownButton<String>(
            value: showBookingController.selectedAddress.value.isEmpty ? null : showBookingController.selectedAddress.value,
            icon: SvgPicture.asset(AppIcons.dropdown),
            onChanged: (String? newValue) {
              if (newValue != null) {
                showBookingController.selectedAddress.value = newValue;
              }
            },
            items: showBookingController.showGroupList
                .map((ShowBookingModel value) {
              return DropdownMenuItem<String>(
                value: value.data?.attributes?.address ?? '',
                child: CustomText(
                  text: value.data?.attributes?.address ?? '',
                  color: const Color(0xff9DA0A3),
                ),
              );
            }).toList(),
          ))

          ],
              ),
              SizedBox(height: 17.h),
              // Booking Container
              Obx(() {
                if (showBookingController.isLoading.value) {
                  return const Center(child: CustomPageLoading());
                } else {
                  return TotalBookingsCompletedRow(
                    providerInfoList: showBookingController.showGroupList,
                  );
                }
              }),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppString.recentBookings,
                    fontsize: 18.h,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.userCategoryScreen);
                    },
                    child: CustomText(
                      text: AppString.seeAll,
                      fontsize: Dimensions.fontSizeDefault.h,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 0 : 16.h),
                      child: ProviderHelpsBookingsCard(
                        ontap: () {
                          Get.toNamed(AppRoutes.providerBookingDetailsScreen);
                        },
                        helpImage: AppImages.helpImage,
                        helpName: "House Cleaning",
                        personName: "Jane Cooper",
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class TotalBookingsCompletedRow extends StatelessWidget {
  final List<ShowBookingModel> providerInfoList;

  const TotalBookingsCompletedRow({super.key, required this.providerInfoList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

      Container(
      width: 112.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.primaryColor, width: 0.5),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Center(
          child: Column(
            children: [
              CustomText(
                text: 'Total Bookings',
                fontsize: 12.h,
              ),

              CustomText(
                text: '${providerInfoList.first.data?.attributes?.totalBooking}',
                fontsize: 12.h,
              ),
            ],
          ),
        ),
      ),
    ),



        Container(
          width: 112.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.primaryColor, width: 0.5),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Center(
              child: Column(
                children: [
                  CustomText(
                    text: 'Completed',
                    fontsize: 12.h,
                  ),

                  CustomText(
                    text: '${providerInfoList.first.data?.attributes?.complitedBooking}',
                    fontsize: 12.h,
                  ),
                ],
              ),
            ),
          ),
        ),




        Container(
          width: 112.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.primaryColor, width: 0.5),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Center(
              child: Column(
                children: [
                  CustomText(
                    text: 'Cancelled',
                    fontsize: 12.h,
                  ),

                  CustomText(
                    text: '${providerInfoList.first.data?.attributes?.cancelledBooking}',
                    fontsize: 12.h,
                  ),
                ],
              ),
            ),
          ),
        )




      ]
    );
  }
}
