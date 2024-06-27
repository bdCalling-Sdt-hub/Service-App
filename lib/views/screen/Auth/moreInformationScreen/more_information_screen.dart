import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_app/controllers/informationController.dart';
import 'package:service_app/helpers/image_picker_helper.dart';
import 'package:service_app/utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
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

  void initState() {
    super.initState();
    addressController.text = parameter['address'] ?? '';
  }

  var profileImage;
  var frontImage;
  var backImage;

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
                    child: Container(
                  height: 150.h,
                  width: 150.h,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor.withOpacity(0.3),
                        image: DecorationImage(
                            image: AssetImage(profileImage != null
                                ? profileImage.path
                                : "assets/icons/carbon_camera.png"),
                            fit: BoxFit.cover)),
                  ),
                )),
              ),
              SizedBox(height: 12.h),
              Text(
                AppString.uploadPhoto,
                style: TextStyle(color: AppColors.primaryColor),
              ),
              SizedBox(height: 24.h),
              //===============================> Address Section <===============================
              Form(
                key: _formKey,
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
                              child: frontImage != null
                                  ? Image.asset(
                                      frontImage.path,
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
                              child: backImage != null
                                  ? Image.asset(
                                      backImage.path,
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth,
                                    )
                                  : SvgPicture.asset(AppIcons.carbonCamera),
                            ),
                          ),
                          SizedBox(height: 31.h),
                          //===============================> Create Button <===============================
                          CustomButton(
                            loading: _informationController.loading.value,
                            onTap: () {
                              if (_formKey.currentState!.validate() &&
                                  profileImage != null &&
                                  frontImage != null &&
                                  backImage != null) {
                                _informationController.moreInformationProfile(
                                    addressController.text,
                                    profileImage,
                                    frontImage,
                                    backImage);
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

  showImagePickerOption(BuildContext context, String source) {
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
                      var imagePath = await ImagePickerHelper.pickImage(
                          ImageSource.gallery);
                      if (source == "profile") {
                        profileImage = imagePath;
                      } else if (source == "front") {
                        frontImage = imagePath;
                      } else {
                        backImage = imagePath;
                      }
                      Get.back();
                      setState(() {});
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
                      var imagePath = await ImagePickerHelper.pickImage(
                          ImageSource.gallery);
                      if (source == "profile") {
                        profileImage = imagePath;
                      } else if (source == "front") {
                        frontImage = imagePath;
                      } else {
                        backImage = imagePath;
                      }
                      Get.back();
                      setState(() {});
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
