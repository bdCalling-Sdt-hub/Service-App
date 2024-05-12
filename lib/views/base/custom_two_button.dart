
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import 'custom_text.dart';

class CustomTwoButon extends StatelessWidget {
  final List? btnNameList;
  final VoidCallback? leftBtnOnTap;
  final VoidCallback? rightBtnOnTap;
  const CustomTwoButon({super.key, this.btnNameList, this.leftBtnOnTap, this.rightBtnOnTap});

  @override
  Widget build(BuildContext context) {
    return               Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(2, (index) {
        return GestureDetector(
          onTap: (){
            index ==  0 ? leftBtnOnTap : rightBtnOnTap;
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(8.r),
                color:
                index == 0 ? Colors.white : AppColors.primaryColor),
            width: 147.w,
            child: Padding(
              padding:
              EdgeInsets.symmetric(vertical: 8.h, horizontal: 7.w),
              child: CustomText(
                  text: index == 0 ?  'Cancel' : 'Submit',
                  color: index == 0 ?  AppColors.primaryColor : Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        );
      }),
    )
    ;
  }
}

