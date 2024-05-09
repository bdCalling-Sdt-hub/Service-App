import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/utils/app_dimentions.dart';
import 'package:service_app/views/base/custom_text_field.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../base/cachanetwork_image.dart';
import '../../../base/custom_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  List messageList = [
    {"name": "Alice", "status": "sender", "message": "Hey there!"},
    {"name": "Bob", "status": "receiver", "message": "Hi, what's up?"},
    {"name": "Charlie", "status": "sender", "message": "Just checking in."},
    {"name": "David", "status": "receiver", "message": "Everything's good here, thanks!"},
    {"name": "Eve", "status": "sender", "message": "Cool."},
    {"name": "Frank", "status": "receiver", "message": "Did you see the latest update?"},
    {"name": "Grace", "status": "sender", "message": "Yes, looks great!"},
    {"name": "Hannah", "status": "receiver", "message": "Agreed, they did a good job."},
    {"name": "Isaac", "status": "sender", "message": "Anyway, gotta go now."},
    {"name": "Jack", "status": "receiver", "message": "Catch you later!"},
  ]
  ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault.w,
              vertical: Dimensions.paddingSizeDefault.h),
          child: Column(
            children: [
              Row(
                children: [
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
                        text: "name",
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


              SizedBox(height: 20.h,),


              Expanded(
                child: ListView.builder(
                  itemCount: messageList.length, // Placeholder for message count
                  itemBuilder: (context, index){
                    var message = messageList[index];

                    return message['status'] == "sender" ?senderBubble(context) :receiverBubble(context);
                  }

                ),
              ),


            ],
          ),
        ),
      ),
    );
  }




  // ChatWidget(Map message) {
  //   return Align(
  //     alignment: message['status'] == "sender" ? Alignment.centerRight : Alignment.centerLeft,
  //     child: Container(
  //       width: 250.w,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8.r),
  //         color: message['status'] == "sender" ?  AppColors.primaryColor : Colors.white
  //       ),
  //
  //       child: Padding(
  //         padding:  EdgeInsets.all(14.r),
  //         child: Column(
  //           children: [
  //
  //             Align(
  //                 alignment: Alignment.centerLeft,
  //                 child: CustomText(text: message['message'], color:  message['status'] == "sender" ? Colors.white : AppColors.subTextColor5c5c5c ,textAlign: TextAlign.start,)),
  //
  //
  //
  //             Align(
  //                 alignment: Alignment.centerRight,
  //                 child: CustomText(text: "01:00 PM", color:  message['status'] == "sender" ? Colors.white : AppColors.subTextColor5c5c5c ,textAlign: TextAlign.start,))
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }





  receiverBubble(BuildContext context) {
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
            // margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.57,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'how are you, sagor ahamed?' ?? "",
                    style: TextStyle(
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
                          'time',
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

  senderBubble(BuildContext context,  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ChatBubble(
            clipper: ChatBubbleClipper5(
              type: BubbleType.sendBubble,
            ),
            alignment: Alignment.topRight,
             margin: const EdgeInsets.only(top: 16, bottom: 16),
            backGroundColor: AppColors.primaryColor,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.57,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'i am fine , whats ' ?? "",
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                     'time',
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


}

