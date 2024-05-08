import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/category_controller.dart';
import 'package:service_app/utils/app_colors.dart';
import 'package:service_app/utils/app_strings.dart';
import 'package:service_app/views/base/category_card.dart';
import 'package:service_app/views/base/custom_text.dart';

class CategoryScreen extends StatefulWidget {
   CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: CustomText(text: AppString.categories,fontsize: 18.h,fontWeight: FontWeight.w500,color: AppColors.black333333,),
      ),



      body: Column(
        children: [





          // Expanded(
          //   child: ListView.builder(
          //     itemCount: (_categoryController.cetegoryList.length / 4).ceil(),
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: EdgeInsets.symmetric(vertical: 6),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: List.generate(4, (i) {
          //             final itemsIndex = index * 4 + i;
          //
          //             if (itemsIndex < _categoryController.cetegoryList.length) {
          //               final category = _categoryController.cetegoryList[itemsIndex];
          //               return CategoryCard(
          //                 categorIcon: category['categoryIcon'],
          //                 categorName: category['categoryName'],
          //                 // isSelected: /* implement logic to determine if category is selected */,
          //                 onTap: () {
          //                   setState(() {
          //                     // Handle onTap logic here
          //                   });
          //                 },
          //               );
          //             }
          //             return const SizedBox();
          //           }),
          //         ),
          //       );
          //     },
          //   ),
          // )


        ],
      ),
    );
  }
}
