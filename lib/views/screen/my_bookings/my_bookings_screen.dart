import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_strings.dart';
import 'package:service_app/views/base/service_card.dart';

import '../../../helpers/route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_images.dart';
import '../../base/custom_text.dart';
import 'Inner_widgets/my_booking_service_card.dart';
import 'Inner_widgets/selected_button.dart';

class MyBookingsScreen extends StatefulWidget {
   MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  int selectedIndex = 0;

  List<String> items = ['Completed', 'Pending', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: CustomText(
          text: AppString.myBookings,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),



      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          children: [

            SizedBox(height: 24.h,),
            SizedBox(
              height: 60.h,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: (items.length / 3).ceil(),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = index * 3; i < (index + 1) * 3; i++)
                        if (i < items.length)
                          SelectedButton(
                            text: items[i],
                            selected: selectedIndex == i,
                            onTap: () {
                              setState(() {
                                selectedIndex = i;
                              });
                            },
                          ),
                    ],
                  );
                },
              ),
            ),




            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 10.h),
                    child: MyBookingServiceCard(
                      ontap: (){
                        Get.toNamed(AppRoutes.myBookignServiceDetailsScreen);
                      },
                      serviceImage: AppImages.serviceImage,
                      selectedBottonItem: selectedIndex,
                      reting: "4.8",
                      distance: "15 km",
                      serviceName: 'House Cleaning',
                      personName: "Ingredia Nutrisha",
                    ),
                  );
                },
              ),
            )



          ],
        ),
      ),

    );
  }
}
