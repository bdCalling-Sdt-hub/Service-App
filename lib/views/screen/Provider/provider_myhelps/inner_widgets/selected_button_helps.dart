import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';

class SelectedButtonHelps extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const SelectedButtonHelps({
    Key? key,
    required this.text,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryColor : AppColors.whiteF4F9EC,
          borderRadius: BorderRadius.circular(8.r),



          boxShadow: [
            BoxShadow(
              color: AppColors.black767676.withOpacity(.5), // color of the shadow
              spreadRadius: 0, // spread radius
              blurRadius: 20, // blur radius
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.subTextColor5c5c5c,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}