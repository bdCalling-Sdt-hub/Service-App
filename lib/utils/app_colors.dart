import 'package:flutter/cupertino.dart';

class AppColors{
  
  static Color primaryColor=const Color(0xFF95C343);
  static Color backgroundColor=const Color(0xFFFFFFFF);
  static Color borderColor = const Color(0xFFB8D781);
  static Color textColor = const Color(0xFF333333);
  static Color subTextColor = const Color(0xFF5C5C5C);


  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xFFFFFFFF00),
        Color(0xFF111827E5),
        Color(0xFF111827E5),
        Color(0xFF111827E5),
        ]
  );


  static BoxShadow shadow=BoxShadow(
    blurRadius: 4,
    spreadRadius: 0,
    offset: const Offset(0, 2),
  );
}