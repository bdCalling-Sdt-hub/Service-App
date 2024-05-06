import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';

class BottomMenu extends StatelessWidget {
  final int menuIndex;

  const BottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? AppColors.primaryColor : theme.disabledColor;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: title,
        icon: Padding(
          padding: const EdgeInsets.only(top:8),
          child: SvgPicture.asset(
            image,
            height: 24.0,
            width: 24.0,
            color: colorByIndex(theme, index),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [

    ];

    return Container(

      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),topLeft: Radius.circular(20.r)
          ),
          boxShadow: const [
            BoxShadow(color:Colors.black38,spreadRadius:0,blurRadius: 10)
          ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),topLeft: Radius.circular(20.r)

        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          
          selectedItemColor:Theme.of(context).primaryColor,
          currentIndex: menuIndex,
          
          onTap: (value) {
            switch (value) {
              case 0:

                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}