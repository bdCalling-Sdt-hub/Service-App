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
                          SelectableItem(
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
                    child: AllServiceCards(
                      ontap: (){
                        Get.toNamed(AppRoutes.serviceDetailsScreen);
                      },
                      serviceImage: AppImages.serviceImage,
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




class AllServiceCards extends StatelessWidget {
  final VoidCallback? ontap;
  final String? serviceImage;
  final String? reting;
  final String? distance;
  final String? serviceName;
  final String? personName;
  const AllServiceCards({super.key, this.serviceImage, this.reting, this.distance, this.serviceName, this.personName, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SizedBox(
            child: Row(
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                    child: Image.asset('$serviceImage', height: 112.h,width: 130.w,fit: BoxFit.cover,)),

                SizedBox(width: 24.w),


                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      ///========================service name======================>
                      Container(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: CustomText(
                            text: "$serviceName",
                            fontsize: Dimensions.fontSizeDefault.h,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            top: 4.h,
                            bottom: 4.h),
                      ),


                      ///=========================person name=========================>
                      Container(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.person,height: 12.h,color: AppColors.subTextColor5c5c5c,),
                            CustomText(
                                textOverflow: TextOverflow.ellipsis,
                                text: " $personName",
                                fontsize: 12.h,
                                color: AppColors.subTextColor5c5c5c),
                          ],
                        ),
                      ),



                      CustomText(
                          textOverflow: TextOverflow.ellipsis,
                          text: " 36.00",
                          fontsize: 16.h,
                          bottom: 15.h,
                          top: 4.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),
                      
                      
                      
                      
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Color(0xffEAF6ED)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                          child: CustomText(text: "Complete",),
                        ),
                      )

                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}


























class SelectableItem extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const SelectableItem({
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