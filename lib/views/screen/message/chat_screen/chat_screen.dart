import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/utils/app_icons.dart';
import 'package:service_app/views/base/custom_loading.dart';

import '../../../../helpers/route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_text.dart';

class ChatScreen extends StatefulWidget {
   const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
   final StreamController _streamController = StreamController();
   final ScrollController _scrollController = ScrollController();
   TextEditingController messageController = TextEditingController();

  List messageList = [
    {"name": "Alice", "status": "sender", "message": "Hey there!"},
    {"name": "Bob", "status": "receiver", "message": "Hi, what's up?"},
    {"name": "Charlie", "status": "sender", "message": "Just checking in."},
    {"name": "David", "status": "receiver", "message": "Everything's good here, thanks!"},
    {"name": "Eve", "status": "sender", "message": "Cool."},
    {"name": "Frank", "status": "receiver", "message": "Did you see the latest update?"},
    {"name": "Alice", "status": "sender", "message": "Hey there!"},
    {"name": "Bob", "status": "receiver", "message": "Hi, what's up?"},
    {"name": "Charlie", "status": "sender", "message": "Just checking in."},
    {"name": "David", "status": "receiver", "message": "Everything's good here, thanks!"},
    {"name": "Eve", "status": "sender", "message": "Cool."},
    {"name": "Frank", "status": "receiver", "message": "Did you see the latest update?"},
  ];

  String? selectedImage;

   @override
   void initState() {
     super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
       _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
       // If you want a smooth scroll animation instead of jumping directly, use animateTo:
       // _scrollController.animateTo(
       //   _scrollController.position.maxScrollExtent,
       //   duration: Duration(milliseconds: 300),
       //   curve: Curves.easeOut,
       // );
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault.w,
              vertical: Dimensions.paddingSizeDefault.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Icon(Icons.arrow_back_ios, color: AppColors.black333333,),
                    ),
                  ),

                  Stack(
                    children: [
                      Container(
                        height: 38.h,
                        width: 38.w,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppImages.serviceImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 13.h,
                          width: 13.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.whiteF4F9EC, width: 1.5.r),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF34DE00),
                                Color(0xFF229400),
                              ],
                              stops: [0.0, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "${Get.parameters['userName']}",
                        fontsize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      CustomText(
                        top: 4.h,
                        text: "Hello, are you here?",
                        fontsize: 12.h,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black767676,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 33),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: CustomButton(
                    width: 147.h,
                    height: 36.h,
                    onTap: () {
                      Get.toNamed(AppRoutes.sendOfferScreen);
                    },
                    text: AppString.sendOffer,
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Expanded(
                child: StreamBuilder(
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    if(true){
                      return ListView.builder(

                        controller: _scrollController,
                          dragStartBehavior: DragStartBehavior.down,
                          itemCount: messageList.length,
                          itemBuilder: (context, index){
                            var message = messageList[index];

                            return message['status'] == "sender" ? senderBubble(context,  message) : receiverBubble(context, message );
                          }

                      );
                    }else{
                      return const CustomLoading();
                    }
                  },
                ),
              ),

              SizedBox(height: 10.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 290.w,
                    child: TextFormField(
                      controller: messageController,
                      decoration:  InputDecoration(
                        hintText: "Type something…",
                        hintStyle: TextStyle(color: AppColors.hintextColorA1A1A1, fontSize: 12.h, fontWeight: FontWeight.w400),
                        suffixIcon: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 11.h, horizontal: 16.w),
                          child: GestureDetector(
                              onTap: (){
                                _pickImageFromGallery();
                              },
                              child: SvgPicture.asset(AppIcons.photo)),
                        ),
                        border: const OutlineInputBorder(

                        )
                      ),
                    ),
                  ),



                  GestureDetector(
                    onTap: (){
                      Map<String, dynamic> newMessage = {
                        "name": "John",
                        "status": "sender",
                        "message": messageController.text,
                      };

                      if(messageController.text.isNotEmpty){
                        messageList.add(newMessage);
                        _streamController.sink.add(messageList);

                        messageController.clear();
                      }else{
                        null;
                      }

                    },


                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(8.r)
                      ),
                        child: Padding(
                          padding: EdgeInsets.all(11.r),
                          child: SvgPicture.asset(AppIcons.sendIcon),
                        )),
                  )
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

  // ChatWidget(Map message) {
  receiverBubble(BuildContext context, Map message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // CustomNetworkImage(
        //   imageUrl: "https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630",
        //   height: 35,
        //   width: 35,
        //   boxShape: BoxShape.circle,
        //   border: Border.all(color: AppColors.black767676, width: 1),
        // ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: ChatBubble(
            clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
            backGroundColor: Colors.white,
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.57,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Text(
                    '${message['message']}' ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.start,
                    // textAlign: TextAlign.start,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          '12:00 am',
                          style: TextStyle(
                            color: AppColors.black333333,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  senderBubble(BuildContext context,  Map message) {
    print("==============> ${message['message'].runtimeType}");
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ChatBubble(
            clipper: ChatBubbleClipper5(
              type: BubbleType.sendBubble,
            ),
            alignment: Alignment.topRight,
             margin: const EdgeInsets.only(top: 8, bottom: 8),
            backGroundColor: AppColors.primaryColor,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.57,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${message['message']}' ?? "",
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                     '1:00 am',
                      textAlign: TextAlign.end,
                      style:
                      TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        // CustomNetworkImage(
        //   imageUrl: 'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630',
        //   height: 35,
        //   width: 35,
        //   boxShape: BoxShape.circle,
        //   border: Border.all(color: AppColors.black767676, width: 1),
        // ),
      ],
    );
  }


   //==================================> Gallery <===============================
   Future _pickImageFromGallery() async {
     final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
     if (returnImage == null) return;
     setState(() {
       messageController.text = returnImage.path;
     });
   }
}

