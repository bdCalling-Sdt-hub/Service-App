import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/role/user/user_home_controller.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_images.dart';

import '../../../../utils/app_colors.dart';
import '../../../base/all_service_card.dart';
import '../../../base/custom_page_loading.dart';
import '../../../base/custom_text.dart';


class UserAllServiceScreen extends StatefulWidget {
   UserAllServiceScreen({super.key});
  @override
  State<UserAllServiceScreen> createState() => _UserAllServiceScreenState();
}

class _UserAllServiceScreenState extends State<UserAllServiceScreen> {
  var parameters = Get.parameters;

  UserHomeController _homeCtrl=Get.put(UserHomeController());

  @override
  void initState() {
    super.initState();
    _homeCtrl.nearbyhelpFirsLoad();
    _homeCtrl.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_homeCtrl.scrollController.position.pixels ==
        _homeCtrl.scrollController.position.maxScrollExtent) {
      _homeCtrl.loadMore();
      print('Load More Check');
    }
  }

  @override
  void dispose() {
    _homeCtrl.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: '${parameters['screenType']}',
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),
      body: _body(),
    );
  }

   _body() {

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: RefreshIndicator(
        onRefresh: ()async{
        },
        child:  ListView.builder(
          itemCount: _homeCtrl.nearbyHelpModel.value.length+1,
          itemBuilder: (context, index) {
            if (index >= _homeCtrl.nearbyHelpModel.value.length) {
              return _homeCtrl.firstLoading.value
                  ? CustomPageLoading()
                  : SizedBox();
            }else{
              var helpCartInfo=_homeCtrl.nearbyHelpModel.value[index];

              print('Item>>${_homeCtrl.nearbyHelpModel.value.length}');
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
      ),
    );


    // return Padding(
    //   padding: EdgeInsets.symmetric(
    //       horizontal: Dimensions.paddingSizeDefault.w,
    //       vertical: Dimensions.paddingSizeDefault.h),
    //   child: Column(
    //     children: [
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: 10,
    //           itemBuilder: (context, index) {
    //             return Padding(
    //               padding:  EdgeInsets.only(top: index == 0 ? 0 : 16.h),
    //               child:  AllServiceCard(
    //                 ontap: (){
    //                   Get.toNamed(AppRoutes.userServiceDetailsScreen);
    //                 },
    //                 serviceImage: AppImages.serviceImage,
    //                 reting: "4.8",
    //                 distance: "15 km",
    //                 serviceName: 'House Cleaning',
    //                 personName: "Ingredia Nutrisha",
    //               ),
    //             );
    //           },
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

