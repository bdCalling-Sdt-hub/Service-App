import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_app/utils/app_colors.dart';

import '../../../../helpers/route.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_text.dart';
import '../../../base/custom_text_field.dart';

class MoreInformationScreen extends StatefulWidget {
   MoreInformationScreen({super.key});

  @override
  State<MoreInformationScreen> createState() => _MoreInformationScreenState();
}

class _MoreInformationScreenState extends State<MoreInformationScreen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController selectImageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {

    });
  }

   Uint8List? _image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: Text(
          AppString.moreInformation,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 24.h),

              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                        radius: 60.r,
                        backgroundImage: MemoryImage(_image!)
                    ):
                    Center(
                        child: GestureDetector(
                            onTap: () {
                              showImagePickerOption(context);
                            },
                            child: SvgPicture.asset(AppIcons.uploadPhoto))),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              //===============================> Text  <===============================
           Text(
               AppString.uploadPhoto,
             style: TextStyle(
                 color: AppColors.primaryColor),),
              SizedBox(height: 24.h),
              Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //===============================> Address Text-field <===============================
                            Text(AppString.address,),
                            SizedBox(height: 8.h),
                            CustomTextField(
                              hintText: AppString.enterAddress,
                              controller: addressController,
                            ),
                            SizedBox(height: 16.h),
                            //===============================> Font Field <===============================
                            Text(AppString.uploadLicenseFront,
                              style: TextStyle(
                                  color: AppColors.black333333),),
                            SizedBox(height: 12.h),
                            Container(
                              height: 95.h,
                              width: 353.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 0.9,
                                ),
                              ),
                              child: SvgPicture.asset(AppIcons.carbonCamera),
                            ),
                            SizedBox(height: 16.h),
                            //===============================> Back Field <===============================
                            Text(AppString.uploadLicenseBack,
                              style: TextStyle(
                                  color: AppColors.black333333),),
                            SizedBox(height: 12.h),
                            Container(
                              height: 95.h,
                              width: 353.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 0.9,
                                ),
                              ),
                              child: SvgPicture.asset(AppIcons.carbonCamera),
                            ),
                            SizedBox(height: 31.h),
                            //===============================>Button Field <===============================
                            CustomButton(
                                onTap: () {
                                  Get.toNamed(AppRoutes.forgotPasswordScreen);
                                },
                                text: AppString.createAccount),
                            SizedBox(height: 25,)
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

   //==================================> ShowImagePickerOption Function <===============================
   void showImagePickerOption(BuildContext context) {
     showModalBottomSheet(
         backgroundColor: AppColors.backgroundColor,
         context: context,
         builder: (builder) {
           return Padding(
             padding: const EdgeInsets.all(18.0),
             child: SizedBox(
               width: MediaQuery
                   .of(context)
                   .size
                   .width,
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 4.2,
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Expanded(
                     child: InkWell(
                       onTap: () {
                         _pickImageFromGallery();
                       },
                       child: SizedBox(
                         child: Column(
                           children: [
                             Icon(
                               Icons.image,
                               size: 50.w,
                             ),
                              CustomText(text: 'Gallery')
                           ],
                         ),
                       ),
                     ),
                   ),
                   Expanded(
                     child: InkWell(
                       onTap: () {
                         _pickImageFromCamera();
                       },
                       child: SizedBox(
                         child: Column(
                           children: [
                             Icon(
                               Icons.camera_alt,
                               size: 50.w,
                             ),
                              CustomText(text: 'Camera')
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           );
         });
   }

   //==================================> Gallery <===============================
   Future _pickImageFromGallery() async {
     final returnImage =
     await ImagePicker().pickImage(source: ImageSource.gallery);
     if (returnImage == null) return;
     setState(() {

     });
     Get.back();
   }

//==================================> Camera <===============================
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {

    });
    // Get.back();
  }
}



