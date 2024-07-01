import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/role/provider/help_controller.dart';
import 'package:service_app/utils/app_icons.dart';

import '../../../../helpers/route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/all_service_card.dart';
import '../../../base/custom_page_loading.dart';
import '../../../base/custom_text.dart';

class ProviderServiceScreen extends StatefulWidget {
  const ProviderServiceScreen({super.key});

  @override
  State<ProviderServiceScreen> createState() => _ProviderServiceScreenState();
}

class _ProviderServiceScreenState extends State<ProviderServiceScreen> {

  HelpController _helpCtrl=Get.put(HelpController());


  @override
  void initState() {
    super.initState();
    _helpCtrl.providerhelpFirsLoad();
    _helpCtrl.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_helpCtrl.scrollController.position.pixels ==
        _helpCtrl.scrollController.position.maxScrollExtent) {
      _helpCtrl.loadMore();
      print('Load More Check');
    }
  }

  @override
  void dispose() {
    _helpCtrl.scrollController.removeListener(_scrollListener);
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.helps,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
//===============================> Body Section <===============================
      body: _body(context),

    );
  }

   _body(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.aboutServiceScreen);
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset(
                        AppIcons.add,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    AppString.addHelp,
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20.h),
          Obx(() =>   Expanded (
              child:RefreshIndicator(
                onRefresh: ()async{
                },
                child:  ListView.builder(
                  itemCount: _helpCtrl.providerHelpModel.value.length+1,
                  itemBuilder: (context, index) {
                    if (index >= _helpCtrl.providerHelpModel.value.length) {
                      return _helpCtrl.firstLoading.value
                          ? CustomPageLoading()
                          : SizedBox();
                    }else{
                      var helpCartInfo=_helpCtrl.providerHelpModel.value[index];

                      print('Item>>${_helpCtrl.providerHelpModel.value.length}');
                      return Padding(
                        padding:  EdgeInsets.only(top: 10.h),
                        child: AllServiceCard(
                          ontap: (){
                            Get.toNamed(AppRoutes.providerServiceDetailsScreen);
                          },
                           helpInfo: helpCartInfo,
                          serviceImage: AppImages.serviceImage,
                          reting: "4.8",
                          distance: "15 km",
                          serviceName: 'Cleaning',
                          personName: "Ingredia Nutrisha",
                        ),
                      );
                    }


                  },
                ),
              )
          ))

        ],
      ),
    );
  }
}

