import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/views/base/custom_button.dart';

import '../../../../helpers/route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_text.dart';
import 'inner_widgets/wallet_amount_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

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
                  Get.offAllNamed(AppRoutes.walletWithdrawalScreen);
                },
                text: AppString.withdraw),
            SizedBox(height: 30.h),
            CustomText(
                text: AppString.lastWithdraw,
                fontWeight: FontWeight.w500,
                fontsize: 16.h,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16.h),

          ],
        ),
      ),
    );
  }
}
