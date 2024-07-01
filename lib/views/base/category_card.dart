import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app/models/role/user_model/all_catagory_model.dart';
import 'package:service_app/services/api_constants.dart';
import 'package:service_app/views/base/cachanetwork_image.dart';

import '../../utils/app_colors.dart';
import 'custom_text.dart';

class CategoryCard extends StatelessWidget {
  final String? categorIcon;
  final String? categorName;
  final bool isSelected;
  final Function()? onTap;
  final UserAllCategoryModel? categoriInfo;

  const CategoryCard(
      {super.key,
        this.categorIcon,
        this.categorName,
        this.categoriInfo,
        this.isSelected = false,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? (){},
      child: Container(
        width: 78.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color:
            isSelected ? AppColors.primaryColor : const Color(0xffF4F9EC)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(13.r),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.all(5.r),
                  child: CustomNetworkImage(
                      imageUrl:"${ApiConstants.imageBaseUrl}${categoriInfo!.catagoryIcon![0].publicFileUrl}",
                      height: 40.h,
                      width: 40.w)
                ),
              ),
            ),
            CustomText(
              text: categoriInfo!.name ?? "",
              fontsize: 12.h,
              bottom: 7.h,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
