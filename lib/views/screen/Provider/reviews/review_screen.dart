import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_text.dart';
import '../../../base/provider_top_review_card.dart';
import 'innerWidget/progress_indicator_rating.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.reviews,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault.w,
              vertical: Dimensions.paddingSizeDefault.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const progressRatingIndicator(),
              SizedBox(height: 24.h),

              SizedBox(
                height: 139 * 3,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child:  const ProviderTopReviewCard(),
                    );
                  },),
              )

            ],
          ),
        ),
      ),
    );
  }
}




