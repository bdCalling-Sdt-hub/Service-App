import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_app/utils/app_strings.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../base/cachanetwork_image.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_text.dart';
import '../../../base/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  var parameter = Get.parameters;
  Uint8List? _image;
  File? selectedIMage;

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _nameController.text =
      parameter['name']! == "null" ? "" : parameter['name']!;
      _emailController.text = parameter['email']!;
      _phoneNumberController.text =
      parameter['phone']! == 'null' ? "" : parameter['phone']!;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text:  AppString.updatePrifle,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 750.h,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 22.h),
                    Center(
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 63.r,
                                  backgroundImage: MemoryImage(_image!))
                              : Container(
                                   clipBehavior: Clip.antiAlias,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: CustomNetworkImage(
                                    imageUrl:
                                        'https://media.licdn.com/dms/image/D5603AQFdl60xoR0NpQ/profile-displayphoto-shrink_800_800/0/1699503758188?e=2147483647&v=beta&t=HT1KNyCH1d5YWMWSkyDIZxY-6N-oi3x6PXD7kUOvKJ8',
                                    height: 100.h,
                                    width: 100.w,
                                  ),
                                ),
                          Positioned(
                              bottom: 0.h,
                              right: 0.w,
                              child: GestureDetector(
                                  onTap: () {
                                    showImagePickerOption(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.whiteF4F9EC,
                                      border: Border.all(color: AppColors.primaryColor)
                                    ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(AppIcons.camera,color: AppColors.primaryColor,),
                                      ))))
                        ],
                      ),
                    ),
                    //======================================> Text From Field Section <===============================================
                    SizedBox(height: 16.h),
                    CustomTextField(
                        controller: _nameController,
                        hintText: 'Enter your name',
                        prefixIcon: _prefixIcon(AppIcons.person)),
                    SizedBox(height: 16.h),
                    //=================================> Email <=========================
                    CustomTextField(
                        controller: _emailController,
                        hintText: 'Enter your name',
                        prefixIcon: _prefixIcon(AppIcons.email)),
                    SizedBox(height: 16.h),

                    //=================================> Phone Number <=========================
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: _phoneNumberController,
                      hintText: '(000) 000-0000',
                      prefixIcon: _prefixIcon(AppIcons.call),
                    ),
                    SizedBox(height: 16.h),


                    //=================================> location <=========================
                    CustomTextField(
                      contentPaddingHorizontal: 30.w,
                      keyboardType: TextInputType.number,
                      controller: _phoneNumberController,
                      hintText:  "location",
                      prefixIcon: _prefixIcon(AppIcons.locationss),
                    ),
                    SizedBox(height: 16.h),

                    const Spacer(),

                    //===========================> Update profile button <===================
                    CustomButton(
                        text: AppString.updatePrifle,
                        onTap: () {}),
                    SizedBox(height: 35.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _prefixIcon(String icon) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 16.w),
      child: SvgPicture.asset(
        icon,
        fit: BoxFit.contain,
        color: AppColors.primaryColor,
      ),
    );
  }

  ///==================================> ShowImagePickerOption Function <===============================

  void showImagePickerOption(BuildContext context) {
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
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 50.w,
                              color: AppColors.primaryColor,
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
                            Icon(Icons.camera_alt,
                                size: 50.w, color: AppColors.primaryColor),
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
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }

//==================================> Camera <===============================
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    // Get.back();
  }
}
