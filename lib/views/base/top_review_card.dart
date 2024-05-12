
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import 'cachanetwork_image.dart';
import 'custom_text.dart';

class TopReviewsCard extends StatefulWidget {
  const TopReviewsCard({super.key});

  @override
  State<TopReviewsCard> createState() => _TopReviewsCardState();
}

class _TopReviewsCardState extends State<TopReviewsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///=====================profile image========================>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 12.w),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CustomNetworkImage(
                    imageUrl: "https://media.licdn.com/dms/image/D5603AQFdl60xoR0NpQ/profile-displayphoto-shrink_800_800/0/1699503758188?e=2147483647&v=beta&t=HT1KNyCH1d5YWMWSkyDIZxY-6N-oi3x6PXD7kUOvKJ8",
                    height: 40.h,
                    width: 40.w,
                  ),
                ),

                ///==========================person name=====================>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Sagor Ahamed',
                      fontWeight: FontWeight.w500,
                    ),

                    ///==========================Star===========================>

                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      unratedColor: const Color(0xffC0C0C0),
                      itemCount: 5,
                      updateOnDrag: true,
                      wrapAlignment: WrapAlignment.start,
                      itemSize: 15.h,
                      itemBuilder: (context, index) {
                        return const Icon(Icons.star,
                            color: Color(0xffFFB701));},
                      onRatingUpdate: (value) {},
                    ),
                  ],
                ),
              ],
            ),

            ///=======================how many time ago=====================>
            Column(
              children: [
                CustomText(
                  text: '1 Month ago',
                  fontWeight: FontWeight.w400,
                  fontsize: 12.h,
                  color: AppColors.subTextColor5c5c5c,
                ),
              ],
            ),
          ],
        ),

        CustomText(
          text:
          "Lorem ipsum dolor sit amet consectetur. Dolor volutpat tellus nunc nulla enim sit. Nunc ut pellentesque aliquet et. Nunc mattis molestie elit malesuada.",
          color: AppColors.subTextColor5c5c5c,
          maxline: 10,
          textAlign: TextAlign.start,
          top: 12.h,
        )
      ],
    );
  }
}
