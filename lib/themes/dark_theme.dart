import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';



ThemeData dark({Color color = const Color(0xFF2683EB)}) => ThemeData(
  fontFamily: 'Poppins',
  primaryColor: color,
  scaffoldBackgroundColor:AppColors.backgroundColor,
  secondaryHeaderColor:  color.withOpacity(0.4),
  disabledColor:AppColors.subTextColor,
  brightness: Brightness.dark,


  inputDecorationTheme: InputDecorationTheme(
    filled: true,

    hintStyle: TextStyle(fontSize:16.sp),
    isDense: true,
    contentPadding:EdgeInsets.symmetric(
      horizontal:12.w,
      vertical: 16.h
    ),
    enabledBorder: enableBorder(),
    focusedBorder: focusedBorder(),
    errorBorder:errorBorder()

  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyle(color:color),
    unselectedLabelStyle: TextStyle(color:AppColors.subTextColor),
  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: color)), colorScheme: ColorScheme.dark(primary: color, secondary: color).copyWith(background: Color(0xFF343636)).copyWith(error: Color(0xFFdd3135)),
);

OutlineInputBorder enableBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide.none,
  );
}
OutlineInputBorder focusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide:BorderSide(
      color: AppColors.primaryColor,
    ),
  );
}

OutlineInputBorder errorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide:const BorderSide(
      color: Colors.red,
    ),
  );
}