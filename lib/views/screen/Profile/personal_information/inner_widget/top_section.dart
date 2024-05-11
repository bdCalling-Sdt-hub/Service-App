import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app/views/base/cachanetwork_image.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../base/custom_text.dart';


class TopSection extends StatelessWidget {
  final String? name;
  final String? image;
  final VoidCallback? ontap;



  TopSection({
    this.name,
    this.image,
    this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w,right: 10.w, top: 12.h, bottom: 12.h),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //=================================> Profile image <==========================
            Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(right: 10.w
              ),
              decoration: BoxDecoration(
                  border: Border.all(width:2.w, color: AppColors.whiteF4F9EC),
                  shape: BoxShape.circle, color: Colors.white),
              child: CustomNetworkImage(
                imageUrl: 'https://media.licdn.com/dms/image/D5603AQFdl60xoR0NpQ/profile-displayphoto-shrink_800_800/0/1699503758188?e=2147483647&v=beta&t=HT1KNyCH1d5YWMWSkyDIZxY-6N-oi3x6PXD7kUOvKJ8',
                height: 100.h,
                width: 90.w,
              )
            ),

            //=================================> Profile Name <==========================
        Container(
          width: 190.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Sagor Ahammed ',
                  textAlign: TextAlign.start,
                  fontsize: 21.h,
                  color: Colors.white,
                  top: 10.h,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: ontap,
                  icon: SvgPicture.asset(
                    AppIcons.edit,
                    color: AppColors.whiteF4F9EC,
                  ),
                ),
              ),
            ],
          ),
        ),

          ],
        ),
      ),
    );
  }
}