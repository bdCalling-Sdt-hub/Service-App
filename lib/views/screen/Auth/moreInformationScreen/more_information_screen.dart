import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/informationController.dart';
import 'package:service_app/helpers/image_picker_helper.dart';
import 'package:service_app/utils/app_colors.dart';
import '../../../../services/api_constants.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_text.dart';
import '../../../base/custom_text_field.dart';

class MoreInformationScreen extends StatefulWidget {
  const MoreInformationScreen({super.key});

  @override
  State<MoreInformationScreen> createState() => _MoreInformationScreenState();
}

class _MoreInformationScreenState extends State<MoreInformationScreen> {

 final _informationController = Get.put(InformationController());

  TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  var parameter = Get.parameters;
  Uint8List? _image;
  Uint8List? frontSideImage;
  Uint8List? backSideImage;

  void initState() {
    super.initState();
    addressController.text = parameter['address'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppString.moreInformation),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24.h),
              //===============================> Upload Photo Section <===============================
              GestureDetector(
                onTap: () {
                  showImagePickerOption(context, 'profile');
                },
                child: Center(
                  child: Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                  radius: 60.r,
                    backgroundImage: _image != null
                        ? MemoryImage(_image!)
                        : (parameter['image'] != null && parameter['image']!.isNotEmpty
                        ? NetworkImage('${ApiConstants.imageBaseUrl}${parameter['image']}')
                        : AssetImage(AppImages.person)) as ImageProvider,
                  )
                          : Center(
                              child: SvgPicture.asset(AppIcons.uploadPhoto),
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                AppString.uploadPhoto,
                style: TextStyle(color: AppColors.primaryColor),
              ),
              SizedBox(height: 24.h),
              //===============================> Address Section <===============================
              Form(
                key:  _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppString.address),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            hintText: AppString.enterAddress,
                            controller: addressController,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            AppString.uploadLicenseFront,
                            style: TextStyle(color: AppColors.black333333),
                          ),
                          SizedBox(height: 12.h),
                          //===============================> Front Side  Section <===============================
                          GestureDetector(
                            onTap: () {
                              showImagePickerOption(context, 'front');
                            },
                            child: Container(
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
                              child: frontSideImage != null
                                  ? Image.memory(
                                      frontSideImage!,
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth,
                                    )
                                  : SvgPicture.asset(AppIcons.carbonCamera),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          //===============================> Back Side Section <===============================
                          Text(
                            AppString.uploadLicenseBack,
                            style: TextStyle(color: AppColors.black333333),
                          ),
                          SizedBox(height: 12.h),
                          GestureDetector(
                            onTap: () {
                              showImagePickerOption(context, 'backSide');
                            },
                            child: Container(
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
                              child: backSideImage != null
                                  ? Image.memory(
                                      backSideImage!,
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth,
                                    )
                                  : SvgPicture.asset(AppIcons.carbonCamera),
                            ),
                          ),
                          SizedBox(height: 31.h),
                          //===============================> Create Button <===============================
                          CustomButton(
                            loading:  _informationController.loading.value,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {

                              }
                              // Get.toNamed(AppRoutes.userBottomNavBar);
                            },
                            text: AppString.createAccount,
                          ),
                          SizedBox(height: 25.h),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
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

                      if (type == 'front') {
                        imageBytes =
                            (await ImagePickerHelper.pickImageFromGallery())
                                as Uint8List?;
                        setState(() {
                          frontSideImage = imageBytes;
                        });
                      } else if (type == 'backSide') {
                        imageBytes =
                            (await ImagePickerHelper.pickImageFromGallery())
                                as Uint8List?;
                        setState(() {
                          backSideImage = imageBytes;
                        });
                      } else if (type == 'profile') {
                        imageBytes = imageBytes =
                            (await ImagePickerHelper.pickImageFromGallery())
                                as Uint8List?;
                        setState(() {
                          _image = imageBytes;
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
                      if (type == 'front') {
                        imageBytes =
                            (await ImagePickerHelper.pickImageFromCamera())
                                as Uint8List?;
                        setState(() {
                          frontSideImage = imageBytes;
                        });
                      } else if (type == 'backSide') {
                        imageBytes =
                            (await ImagePickerHelper.pickImageFromCamera())
                                as Uint8List?;
                        setState(() {
                          backSideImage = imageBytes;
                        });
                      } else if (type == 'profile') {
                        imageBytes = imageBytes =
                            (await ImagePickerHelper.pickImageFromCamera())
                                as Uint8List?;
                        setState(() {
                          _image = imageBytes;
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
