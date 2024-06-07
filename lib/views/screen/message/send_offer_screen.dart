import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_icons.dart';
import '../../../utils/app_strings.dart';
import '../../base/custom_button.dart';
import '../../base/custom_text_field.dart';

class SendOfferScreen extends StatefulWidget {
   const SendOfferScreen({super.key});

  @override
  State<SendOfferScreen> createState() => _SendOfferScreenState();
}

class _SendOfferScreenState extends State<SendOfferScreen> {

  TextEditingController selectHelpController = TextEditingController();
  TextEditingController helpDescriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.sendOffer),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //===============================> Select Help <===============================
                          const Text(AppString.selectHelp),
                          SizedBox(height: 8.h),
                          DropdownButtonFormField<String>(
                            value: selectedCategory,
                            onChanged: (value) {
                              // setState(() {
                              //   selectedCategory = value;
                              // });
                            },
                            items: [
                              'Category 1',
                              'Category 2',
                              'Category 3',
                            ].map((String category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(category),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              hintText: AppString.selectHelp,
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: SvgPicture.asset(
                                  AppIcons.chevronIcon,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Help Description Field <===============================
                          const Text(AppString.helpDescription),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: SizedBox(
                              width: double.infinity,
                              child: CustomTextField(
                                maxLine: 4,
                                hintText: AppString.writeHelpDescription,
                                controller: helpDescriptionController,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Price <===============================
                          const Text(AppString.price),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            hintText: AppString.enterPrice,
                            controller: priceController,
                          ),

                          SizedBox(height: 274.h),
                          //===============================> Send offer Button <===============================
                          CustomButton(
                            onTap: () {
                              // Get.offAllNamed(AppRoutes.chatScreen);
                            },
                            text: AppString.sendOffer,
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
