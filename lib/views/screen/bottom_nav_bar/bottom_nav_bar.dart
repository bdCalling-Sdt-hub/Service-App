import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_app/views/screen/Home/home_screen.dart';
import 'package:service_app/views/screen/message/Message/message_screen.dart';
import 'package:service_app/views/screen/service/service_screen.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../Profile/profile_screen.dart';



class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavBar> {
  int _selectedIndex = 0;


  static final List _widgetOptions = [
    HomeScreen(),
    ServiceScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _widgetOptions.elementAt(_selectedIndex),

      ///------------------------bottom nav bar----------------------------?>
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          ///---------------home---------------->
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.homeBottomNavbar,
              color: Colors.white
            ),
            label: 'Home',
          ),

          ///---------------events---------------->
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.serviecIcon,
              color: Colors.white
            ),
            label: 'Events',
          ),

          ///---------------matches---------------->
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.massegeIcon,
              color: Colors.white
            ),
            label: 'Messages',
          ),

          ///---------------profile---------------->
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.profileIconBottombar,
              color: Colors.white
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
         showUnselectedLabels: false,
        iconSize: 20.h,
        backgroundColor: AppColors.primaryColor,
        selectedFontSize: 14.h,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,

      ),
    );
  }
}