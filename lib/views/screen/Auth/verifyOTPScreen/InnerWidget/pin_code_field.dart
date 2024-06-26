import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../utils/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  TextEditingController otpCTE;
   CustomPinCodeTextField({super.key, required this.otpCTE});

  @override
  Widget build(BuildContext context) {
    return  PinCodeTextField(
      autoDisposeControllers: false,
      backgroundColor: Colors.transparent,
      cursorColor: AppColors.primaryColor,
      controller: otpCTE,
      textStyle: TextStyle(color: AppColors.primaryColor),
      autoFocus: false,
      appContext: context,
      length: 6,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          selectedColor: AppColors.primaryColor,
          activeFillColor: AppColors.borderColorcee3a9,
          selectedFillColor: AppColors.borderColorcee3a9,
          inactiveFillColor: AppColors.borderColorcee3a9,
          fieldHeight: 57.h,
          fieldWidth: 44.w,
          inactiveColor: Colors.grey,
          activeColor: AppColors.primaryColor),
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        print("----value: $value");
      },
    );
  }
}