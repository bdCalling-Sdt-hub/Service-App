import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/views/base/custom_button.dart';

import '../../../../helpers/route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_text.dart';
import 'inner_widgets/wallet_amount_card.dart';

class WalletScreen extends StatelessWidget {
   WalletScreen({super.key});

  TextEditingController walletController = TextEditingController();
  TextEditingController profileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.wallets,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w, vertical: 24.h),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WalletAmountCard(
                  title: AppString.walletText,
                  amount: 5000,
                ),
                WalletAmountCard(
                  title: AppString.walletText,
                  amount: 67000.00,
                )
              ],
            ),
            SizedBox(height: 31.h),
            CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.walletWithdrawalScreen);
                },
                text: AppString.withdraw),
            SizedBox(height: 30.h),
            CustomText(
                text: AppString.lastWithdraw,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontsize: 16.h,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                // (_walletController.walletModel.value.data?.attributes?.length ?? 0) <= 3
                //     ? _walletController
                //     .walletModel.value.data?.attributes?.length
                //     : _walletController.walletModel.value.data?.attributes
                //     ?.sublist(0, 3)
                //     .length,
                itemBuilder: (context, index) {
                  var formatDate = '';
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffDEECC5)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 17.w),
                            child: SvgPicture.asset(
                              AppIcons.withdrawalIcon,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: AppString.withdrawal,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            SizedBox(height: 6.h),
                            CustomText(
                              text: "2024 Jan 16",
                              fontWeight: FontWeight.w400,
                              fontsize: 10.h,
                              color: AppColors.hintextColorA1A1A1,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ///==============================withdrawal Amount ======================>
                            CustomText(
                              text: '-\$1000',
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                            SizedBox(height: 6.h),

                            ///============================Status ===============================>
                            CustomText(
                              text: 'pending',
                              fontWeight: FontWeight.w500,
                              fontsize: 12.h,
                              color: AppColors.primaryColor
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
