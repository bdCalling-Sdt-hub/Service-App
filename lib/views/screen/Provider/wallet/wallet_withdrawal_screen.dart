import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_text.dart';
import '../../../base/custom_text_field.dart';

class WalletWithdrawalScreen extends StatefulWidget {
   const WalletWithdrawalScreen({super.key});

  @override
  State<WalletWithdrawalScreen> createState() => _WalletWithdrawalScreenState();
}

class _WalletWithdrawalScreenState extends State<WalletWithdrawalScreen> {

  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController withdrawalAmountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.withdrawal,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24.h),
                //===============================> Request <===============================
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.requestWithdrawal,
                            style: TextStyle(color: AppColors.black333333),
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Bank Name Field <===============================
                          const Text(AppString.bankName),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            hintText: AppString.enterBankName,
                            controller: bankNameController,
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Account Type Field <===============================
                          const Text(AppString.accountType),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            hintText: AppString.enterAccountType,
                            controller: accountTypeController,
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Account Number Field <===============================
                          const Text(AppString.accountNumber),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            hintText: AppString.enterAccountNumber,
                            controller: accountNumberController,
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Withdrawal Amount Field <===============================
                          const Text(AppString.withdrawalAmount),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            hintText: AppString.withdrawals,
                            controller: withdrawalAmountController,
                          ),

                          SizedBox(height: 174.h),
                          //===============================> Service Button <===============================
                          CustomButton(
                            onTap: () {
                              // Get.offAllNamed(AppRoutes.providerServiceScreen);
                            },
                            text: AppString.requestWithdraw,
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
