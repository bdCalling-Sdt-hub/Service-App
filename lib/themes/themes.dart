import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';


class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor:AppColors.primaryColor,
    ///-------------------------elevated button theme------------------------->
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          backgroundColor:AppColors.primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.maxFinite, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),

      ///-----------------app bar theme------------------>
      appBarTheme:  AppBarTheme(
          color: Colors.transparent,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),

          titleTextStyle: TextStyle(fontSize:18,color:AppColors.black333333),
          elevation: 0,
      ),
      iconTheme: IconThemeData(
        color: AppColors.primaryColor
      ),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor)), colorScheme: ColorScheme.dark(primary: AppColors.primaryColor, secondary: AppColors.primaryColor).copyWith(background: Color(0xFF343636)).copyWith(error: Color(0xFFdd3135)),




      ///--------------------text filed themes----------------------->
      inputDecorationTheme: InputDecorationTheme(
          contentPadding:
          EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.h),
          isDense: true,
          hintStyle: TextStyle(
              fontSize: 16.h, fontWeight: FontWeight.w400, color: AppColors.subTextColor5c5c5c),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:const BorderSide(
              color: Color(0xFFCEE3A9),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.borderColor, width: 1)
          ),

      )



  );


  ///----------------------------dart theme------------------------------->
  final darkTheme = ThemeData.dark().copyWith(

    ///-------------------------elevated button theme------------------------->
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.maxFinite, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),


      ///-----------------app bar theme------------------>
      appBarTheme: const AppBarTheme(
          centerTitle: false,
          color: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.white10),

      ///--------------------text filed themes----------------------->
      inputDecorationTheme: InputDecorationTheme(
          contentPadding:
          EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.h),
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
              fontSize: 16.h, fontWeight: FontWeight.w400, color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.borderColor, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.borderColor, width: 1))));
}
