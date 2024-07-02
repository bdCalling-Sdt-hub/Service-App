import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_strings.dart';
import '../../../../utils/app_colors.dart';
import '../../../base/custom_text.dart';
import '../../User/User_my_bookings/Inner_widgets/selected_button.dart';


class ProviderHelpsScreen extends StatefulWidget {
  const ProviderHelpsScreen({super.key});

  @override
  State<ProviderHelpsScreen> createState() => _ProviderHelpsScreenState();
}

class _ProviderHelpsScreenState extends State<ProviderHelpsScreen> {
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
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w,vertical: Dimensions.paddingSizeDefault.h),
        child: Column(
          children: [

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

            SizedBox(height: 24 .h),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 7,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding:  EdgeInsets.only(bottom: 16.h),
            //         child: ProviderHelpsBookingsCard(
            //           ///========================route to details screen==========================>
            //           ontap: (){
            //             Get.toNamed(AppRoutes.providerBookingDetailsScreen, parameters: {
            //               'bookingStatus' : selectedIndex.toString()
            //             });
            //           },
            //           helpImage: AppImages.helpImage,
            //           // selectedBottonItem: selectedIndex,
            //           helpName: "House Cleaning",
            //           personName: "Jane Cooper",
            //         ),
            //       );
            //     },
            //   ),
            // )

          ],
        ),
      ),

    );
  }
}

