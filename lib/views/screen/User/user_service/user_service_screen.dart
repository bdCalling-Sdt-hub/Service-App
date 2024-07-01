import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/role/user/user_service_controller.dart';
import 'package:service_app/helpers/route.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/all_service_card.dart';
import '../../../base/custom_page_loading.dart';
import '../../../base/custom_text.dart';
import '../../../base/general_error_screen.dart';
import '../../../base/no_internet_screen.dart';

class UserServiceScreen extends StatefulWidget {
  const UserServiceScreen({super.key});

  @override
  State<UserServiceScreen> createState() => _UserServiceScreenState();
}

class _UserServiceScreenState extends State<UserServiceScreen> {

  UserServiceController _userServiceCtrl=Get.put(UserServiceController());

  @override
  void initState() {
    super.initState();
    _userServiceCtrl.userServicehelpFirsLoad();
    _userServiceCtrl.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_userServiceCtrl.scrollController.position.pixels ==
        _userServiceCtrl.scrollController.position.maxScrollExtent) {
      _userServiceCtrl.loadMore();
      print('Load More Check');
    }
  }



  @override
  void dispose() {
    _userServiceCtrl.scrollController.removeListener(_scrollListener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.helps,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.black333333,
        ),
      ),


      body:Obx((){
        switch (_userServiceCtrl.rxRequestStatus.value) {
          case Status.loading:
            return const CustomPageLoading();
          case Status.internetError:
            return NoInternetScreen(onTap:(){
              _userServiceCtrl.userServicehelpFirsLoad();
            });
          case Status.error:
            return GeneralErrorScreen(onTap: (){
              _userServiceCtrl.userServicehelpFirsLoad();
            });
          case Status.completed:
            return   _body(context);
          default:
            return Container();
        }
      }),

    );
  }

   _body(BuildContext context) {
    return _userServiceCtrl.userServiceHelpModel.value.isNotEmpty? RefreshIndicator(
      onRefresh: ()async{
      },
      child:  ListView.builder(
        itemCount: _userServiceCtrl.userServiceHelpModel.value.length+1,
        itemBuilder: (context, index) {
          if (index >= _userServiceCtrl.userServiceHelpModel.value.length) {
            return _userServiceCtrl.firstLoading.value
                ? CustomPageLoading()
                : SizedBox();
          }else{
            var helpCartInfo=_userServiceCtrl.userServiceHelpModel.value[index];

            return Padding(
              padding:  EdgeInsets.only(top: 10.h),
              child: AllServiceCard(
                ontap: (){
                 // Get.toNamed(AppRoutes.providerServiceDetailsScreen);
                },
                helpInfo: helpCartInfo,
              ),
            );
          }


        },
      ),
    )
    :Text('No Data');
  }
}
