import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../helpers/image_picker_helper.dart';
import '../../../../helpers/route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_text.dart';
import '../../../base/custom_text_field.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  TextEditingController helpNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController helpDetailsController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Uint8List? serviceImage;
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.addService),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24.h),
                //===============================> Upload Service Photo <===============================
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.uploadService,
                            style: TextStyle(color: AppColors.black333333),
                          ),
                          SizedBox(height: 12.h),
                          GestureDetector(
                            onTap: () {
                              showImagePickerOption(context, 'service');
                            },
                            child: Container(
                              height: 115.h,
                              width: 353.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 0.9,
                                ),
                              ),
                              child: serviceImage != null
                                  ? Image.memory(
                                serviceImage!,
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              )
                                  : SvgPicture.asset(AppIcons.carbonCamera),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Select Category Field <===============================
                          const Text(AppString.selectCategory),
                          SizedBox(height: 8.h),
                          DropdownButtonFormField<String>(
                            value: selectedCategory,
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                              });
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
                              hintText: AppString.selectServiceCategory,
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
                          //===============================> Help Name Field <===============================
                          const Text(AppString.helpName),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            hintText: AppString.enterServiceName,
                            controller: helpNameController,
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Address Field <===============================
                          Text(AppString.address),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            hintText: AppString.enterServiceName,
                            controller: addressController,
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Help Details Field <===============================
                          const Text(AppString.helpsDetail),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: SizedBox(
                              width: double.infinity,
                              child: CustomTextField(
                                maxLine: 4,
                                hintText: AppString.writeServiceDetails,
                                controller: helpDetailsController,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Service Button <===============================
                          CustomButton(
                            onTap: () {
                              // Get.offAllNamed(AppRoutes.providerServiceScreen);
                            },
                            text: AppString.addService,
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

  void showImagePickerOption(BuildContext context, String type) {
    showModalBottomSheet(
      backgroundColor: AppColors.backgroundColor,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Uint8List? imageBytes;
                      if (type == 'service') {
                        imageBytes =
                        (await ImagePickerHelper.pickImageFromGallery())
                        as Uint8List?;
                        setState(() {
                          serviceImage = imageBytes;
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 50.w,
                          ),
                          CustomText(text: 'Gallery'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Uint8List? imageBytes;
                      if (type == 'service') {
                        imageBytes =
                        (await ImagePickerHelper.pickImageFromCamera())
                        as Uint8List?;
                        setState(() {
                          serviceImage = imageBytes;
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 50.w,
                          ),
                          CustomText(text: 'Camera'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
