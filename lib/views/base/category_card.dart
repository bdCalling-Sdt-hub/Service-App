

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import 'custom_text.dart';

class CategoryCard extends StatelessWidget {
  final String? categorIcon;
  final String categorName;
  final bool isSelected;
  final Function()? onTap;

  const CategoryCard(
      {super.key,
        this.categorIcon,
        this.categorName = '',
        this.isSelected = false,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color:
          isSelected! ? AppColors.primaryColor : const Color(0xffF4F9EC)),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap ?? (){},
            child: Padding(
              padding: EdgeInsets.all(14.r),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.all(5.r),
                  child: SvgPicture.asset(
                    categorIcon ?? "",
                    color: isSelected
                        ? AppColors.primaryColor
                        : const Color(0xff9DA0A3),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomText(
              text: categorName,
              fontsize: 12.h,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}