import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/helpers/pref_helpers.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_colors.dart';
import 'package:service_app/utils/app_constants.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/utils/app_strings.dart';
import 'package:service_app/views/base/custom_text.dart';
import 'package:service_app/views/base/custom_two_button.dart';
import '../../../base/custom_list_tile.dart';
import 'inner_widget/top_container_section.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchToProvide = false;
  String role = '';

  @override
  void initState() {
    super.initState();
    getPrefsData();
    role;
  }

  getPrefsData() async {
    String fetchedRole = await PrefsHelper.getString(AppConstants.role);
    print('Fetched role: $fetchedRole');
    setState(() {
      role = fetchedRole;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("======> role : $role");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopProfileCard(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault.w,
                  vertical: Dimensions.paddingSizeDefault.h),
              child: Column(
                children: [
                  CustomListTile(
                      title: AppString.switchToProviderAccount,
                      prefixIcon: SvgPicture.asset(AppIcons.user,
                          color: AppColors.primaryColor),
                      sufixIcon: GestureDetector(
                        onTap: () async{
                          setState(() {
                            switchToProvide = !switchToProvide;

                            // PrefsHelper.setString(AppConstants.role, switchToProvide ?  'user' : "provider");
                            // switchToProvide
                            //     ? Get.toNamed(AppRoutes.providerBottomNavBar)
                            //     : Get.toNamed(AppRoutes.userBottomNavBar);

                          });
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 18.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.black333333
                                          .withOpacity(.20)),
                                  borderRadius: BorderRadius.circular(20.r)),
                            ),
                            Positioned(
                              left: switchToProvide ? null : -1,
                              right: switchToProvide ? -1 : null,
                              child: Container(
                                height: 18.h,
                                width: 20.w,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle),
                              ),
                            )
                          ],
                        ),
                      )),
                  CustomListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.personalInformation);
                    },
                    title: AppString.personalInformaition,
                    prefixIcon: SvgPicture.asset(AppIcons.user,
                        color: AppColors.primaryColor),
                  ),

                  ///====================helps offers===============>
                  role == "provider"
                      ? const SizedBox()
                      : CustomListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.userHelpOfferScreen);
                    },
                    title: AppString.helpOffers,
                    prefixIcon: SvgPicture.asset(AppIcons.helpIcons,
                        color: AppColors.primaryColor),
                  ),


                  ///====================my helps ===============>
                  CustomListTile(
                    onTap: () {
                     role == 'provider' ?   Get.toNamed(AppRoutes.providerhelpsScreen) :  Get.toNamed(AppRoutes.userMyBookingsScreen);
                    },
                    title: AppString.myHelps,
                    prefixIcon: SvgPicture.asset(AppIcons.helpIcons,
                        color: AppColors.primaryColor),
                  ),


                  ///====================wallet===============>
                  role == "user"
                      ? SizedBox()
                      : CustomListTile(
                          onTap: () {
                            Get.toNamed(AppRoutes.walletScreen);
                          },
                          title: AppString.wallet,
                          prefixIcon: SvgPicture.asset(AppIcons.walletsIcon,
                              color: AppColors.primaryColor),
                        ),

                  ///====================setting===============>
                  CustomListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.settingScreen);
                    },
                    title: AppString.setting,
                    prefixIcon: SvgPicture.asset(AppIcons.setting,
                        color: AppColors.primaryColor),
                  ),

                  ///====================reviews===============
                  role == "user"
                      ? SizedBox()
                      : CustomListTile(
                          onTap: () {
                            Get.toNamed(AppRoutes.reviewScreen);
                          },
                          title: AppString.reviews,
                          prefixIcon: SvgPicture.asset(AppIcons.reviewIcon,
                              color: AppColors.primaryColor),
                        ),

                  ///====================log out===============>
                  CustomListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 300.h),
                            child: const LogoutDialog(),
                          );
                        },
                      );
                    },
                    title: AppString.logout,
                    prefixIcon: SvgPicture.asset(AppIcons.logout,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 135.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              CustomText(
                  text: AppString.areYouSureToLogout,
                  fontWeight: FontWeight.w500,
                  fontsize: 16.h,
                  bottom: 24.h),
              CustomTwoButon(
                btnNameList: const ['Yes', 'No'],
                width: 120.w,
                leftBtnOnTap: () async{

                  print("=======> ${await PrefsHelper.getString(AppConstants.role)}");
                  await PrefsHelper.remove(AppConstants.role);

                  Get.offAllNamed(AppRoutes.onBoardingScreen);
                },
                rightBtnOnTap: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
