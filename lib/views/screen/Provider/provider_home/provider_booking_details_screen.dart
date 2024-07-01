import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/booking_details_controller.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/cachanetwork_image.dart';
import 'package:service_app/views/base/custom_button.dart';
import 'package:service_app/views/base/custom_loading.dart';
import 'package:service_app/views/base/custom_two_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_text.dart';

class ProviderBookingDetailsScreen extends StatefulWidget {
  const ProviderBookingDetailsScreen({super.key});

  @override
  State<ProviderBookingDetailsScreen> createState() => _ProviderBookingDetailsScreenState();
}

class _ProviderBookingDetailsScreenState extends State<ProviderBookingDetailsScreen> {

  var productId = Get.arguments;

  final BookingDetailsController _detailsBookingController = Get.put(BookingDetailsController());

  @override
  void initState() {
    super.initState();
    _detailsBookingController.bookingDetailsGetGroupList(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.bookingDetails,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault.w,
              vertical: Dimensions.paddingSizeDefault.h),
          child: Obx((){
            return  _detailsBookingController.isLoading.value ? const CustomLoading() : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CustomNetworkImage(
                    imageUrl: 'https://i.dailymail.co.uk/1s/2019/08/26/01/17686528-7393969-image-a-51_1566780716617.jpg',
                    height: 164.h,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CustomText(
                        text: 'House Cleaning',
                        fontWeight: FontWeight.w500,
                        fontsize: 20.h,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteF4F9EC,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.h),
                        child: Center(
                          child: SvgPicture.asset(AppIcons.message),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.location,
                          color: AppColors.color9DA0A3,
                        ),
                        CustomText(
                          text: ' ${_detailsBookingController.bookingDetailsModel.value.provider?.address}',
                          fontWeight: FontWeight.w400,
                          fontsize: 12.h,
                          color: AppColors.color9DA0A3,
                        ),
                      ],
                    ),
                  ],
                ),
                CustomText(
                  text: 'Help Details',
                  fontWeight: FontWeight.w500,
                  fontsize: 20.h,
                  top: 16.h,
                ),
                CustomText(
                  text: '${_detailsBookingController.bookingDetailsModel.value.helpDescription}',
                  fontsize: 14.h,
                  textAlign: TextAlign.start,
                  color: AppColors.subTextColor5c5c5c,
                  maxline: 10,
                  top: 12.h,
                ),
                CustomText(
                  text: 'User Details',
                  fontWeight: FontWeight.w500,
                  fontsize: 20.h,
                  bottom: 16.h,
                  top: 16.h,
                ),
                _row(AppString.userName, '${_detailsBookingController.bookingDetailsModel.value.user?.name}'),
                _row(AppString.service, '${_detailsBookingController.bookingDetailsModel.value.selectHelp}'),
                SizedBox(height: 16.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppString.status,
                      color: AppColors.subTextColor5c5c5c,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.whiteF4F9EC,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                        child: CustomText(
                          maxline: 4,
                          textAlign: TextAlign.end,
                          text: "${_detailsBookingController.bookingDetailsModel.value.status}",
                          color: AppColors.black333333,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                _row(AppString.address, '${_detailsBookingController.bookingDetailsModel.value.user?.address}'),
                _row(AppString.phoneNumber, '${_detailsBookingController.bookingDetailsModel.value.user?.phone}'),
                SizedBox(height: 40.h),
                Get.parameters['screenType'] == "profile" ?
                CustomTwoButon(
                  leftBtnOnTap: () { Get.back(); },
                  width: 165.w,
                  btnNameList: ['Cancel', 'Accept'],
                ) :
                CustomButton(
                  onTap: () {
                    Get.back();
                  },
                  text: AppString.completeWork,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _row(String trailingText, String leadingText) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: trailingText,
            color: AppColors.subTextColor5c5c5c,
          ),
          SizedBox(
            width: 204.w,
            child: CustomText(
              maxline: 4,
              textAlign: TextAlign.end,
              text: leadingText,
              color: AppColors.black333333,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
