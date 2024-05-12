

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../base/custom_text.dart';
import '../../../../base/custom_two_button.dart';


class AlartDialog extends StatefulWidget {
  const AlartDialog({super.key});

  @override
  State<AlartDialog> createState() => _AlartDialogState();
}

class _AlartDialogState extends State<AlartDialog> {
  TextEditingController reviewControler = TextEditingController();
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            children: [
              SvgPicture.asset(
                AppIcons.badge,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
              CustomText(
                text: 'Give rating out of 5!',
                fontsize: 18.h,
                fontWeight: FontWeight.w500,
                top: 24.h,
                bottom: 6.h,
              ),
              SizedBox(
                height: 30,
                child: RatingBar.builder(
                  initialRating: rating,
                  minRating: 0,
                  unratedColor: const Color(0xffC0C0C0),
                  itemCount: 5,
                  updateOnDrag: true,
                  wrapAlignment: WrapAlignment.start,
                  itemSize: 25.h,
                  itemBuilder: (context, index) {
                    return const Icon(Icons.star, color: Color(0xffFFB701));
                  },
                  onRatingUpdate: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.h),
              TextFormField(

                controller: reviewControler,
                decoration: InputDecoration(
                    hintText: 'Write your feedback',
                    hintStyle: TextStyle(color: Color(0xffC0C0C0),fontSize: 14.h)
                ),
                style: TextStyle(color: AppColors.subTextColor5c5c5c,fontSize: 14.h),
                maxLines: 3,
              ),
              SizedBox(height: 24.h),

              CustomTwoButon(
                btnNameList: ["Cancel", "Submit"],
                width: 147.w,
                leftBtnOnTap: (){
                  Get.back();
                },
                rightBtnOnTap: (){
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


