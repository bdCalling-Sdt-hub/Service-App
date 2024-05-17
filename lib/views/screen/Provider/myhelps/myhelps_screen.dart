import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_strings.dart';
import '../../../../helpers/route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../base/custom_text.dart';
import '../../User/User_my_bookings/Inner_widgets/selected_button.dart';
import 'inner_widgets/helps_booking_card.dart';


class HelpsScreen extends StatefulWidget {
  const HelpsScreen({super.key});

  @override
  State<HelpsScreen> createState() => _HelpsScreenState();
}

class _HelpsScreenState extends State<HelpsScreen> {
  int selectedIndex = 0;

  List<String> items = ['Completed', 'Pending', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: CustomText(
          text: AppString.myHelps,
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
                physics: const NeverScrollableScrollPhysics(),
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
                    child: HelpsBookingsCard(
                      ///========================route to details screen==========================>
                      ontap: (){
                        // Get.toNamed(AppRoutes.userMyBookignServiceDetailsScreen, parameters: {
                        //   'bookingStatus' : selectedIndex.toString()
                        // });
                      },
                      helpImage: AppImages.helpImage,
                      selectedBottonItem: selectedIndex,
                      helpName: "House Cleaning",
                      personName: "Jane Cooper",
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

