import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/role/user/user_home_controller.dart';
import 'package:service_app/helpers/route.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_images.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../base/all_service_card.dart';
import '../../../base/custom_page_loading.dart';
import '../../../base/custom_text.dart';
import '../../../base/general_error_screen.dart';
import '../../../base/no_internet_screen.dart';


class AllPopularHelpScreen extends StatefulWidget {
  AllPopularHelpScreen({super.key});
  @override
  State<AllPopularHelpScreen> createState() => _AllPopularHelpScreenState();
}

class _AllPopularHelpScreenState extends State<AllPopularHelpScreen> {
  var parameters = Get.parameters;

  UserHomeController _homeCtrl=Get.put(UserHomeController());

  @override
  void initState() {
    super.initState();
    _homeCtrl.populerFirsLoad();
    _homeCtrl.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_homeCtrl.scrollController.position.pixels ==
        _homeCtrl.scrollController.position.maxScrollExtent) {
      _homeCtrl.popularloadMore();
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
        body:  Obx((){
          switch (_homeCtrl.rxRequestStatus.value) {
            case Status.loading:
              return const CustomPageLoading();
            case Status.internetError:
              return NoInternetScreen(onTap:(){
                _homeCtrl.populerFirsLoad();
              });
            case Status.error:
              return GeneralErrorScreen(onTap: (){
                _homeCtrl.populerFirsLoad();
              });
            case Status.completed:
              return   _body(context);
            default:
              return Container();
          }
        })
    );
  }

  _body(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: RefreshIndicator(
        onRefresh: ()async{
        },
        child:  ListView.builder(
          itemCount: _homeCtrl.popularHelpModel.value.length+1,
          itemBuilder: (context, index) {
            if (index >= _homeCtrl.popularHelpModel.value.length) {
              return _homeCtrl.firstLoading.value
                  ? CustomPageLoading()
                  : SizedBox();
            }else{
              var helpCartInfo=_homeCtrl.popularHelpModel.value[index];

              return Padding(
                padding:  EdgeInsets.only(top: 10.h),
                child: AllServiceCard(
                  ontap: (){
                    Get.toNamed(AppRoutes.providerServiceDetailsScreen);
                  },
                  helpInfo: helpCartInfo,
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

