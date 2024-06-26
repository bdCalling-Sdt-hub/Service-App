import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/app_colors.dart';
import 'package:timeago/timeago.dart' as TimeAgo;

import '../../../utils/app_dimentions.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_strings.dart';
import '../../base/custom_text.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {



  final ScrollController _scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   _addScrollListener();
  // }
  //
  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
  //
  // void _addScrollListener() {
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       _notificationController.loadMore();
  //       print("load more true");
  //     }
  //   });
  // }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----------------------------------app bar section-------------------------->
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          textAlign: TextAlign.start,
          text: AppString.notifications,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),

      ///-----------------------------------body section-------------------------->
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15),
        child: Column(
          children: [

            ///-----------------------notification------------------------>

            Expanded(
              child:
              ListView.builder(
                itemCount: 10,
                itemBuilder : (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h, top: index == 0 ? 20.h : 0),
                      child: _Notification('Your booking request has approved.' , DateTime.now()),
                    );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  _Notification(String title, DateTime time) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.whiteF4F9EC,
        borderRadius: BorderRadius.circular(4.r)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColor),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.w, right: 7.w),
                padding: EdgeInsets.all(7.r),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffffffff)),
                child: SvgPicture.asset(
                  AppIcons.notificationBell,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          Expanded(
            // Expanded widget to allow the text to take up available space
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.fontSizeLarge.h,
                      color: AppColors.black333333,
                      fontFamily: "Aldrich",
                      height: 1.5),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    top: 2.h,

                    text: TimeAgo.format(time),
                    fontsize: Dimensions.fontSizeSmall.h,
                    fontWeight: FontWeight.w400,
                    color: const Color(
                      0xFF8C8C8C,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}