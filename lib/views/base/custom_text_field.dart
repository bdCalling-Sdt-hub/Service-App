import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscure;
  final Color? filColor;
  final Color? borderColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final bool isPassword;
  final bool? isEmail;

  const CustomTextField(
      {super.key,
      this.contentPaddingHorizontal,
      this.contentPaddingVertical,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
        this.borderColor,
      this.isEmail,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.isObscureText = false,
      this.obscure = '*',
      this.filColor,
      this.labelText,
      this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscure!,
      // validator: widget.validator,
      validator: widget.validator ??
          (value) {
            if (widget.isEmail == null) {
              if (value!.isEmpty) {
                return "Please enter ${widget.hintText!.toLowerCase()}";
              } else if (widget.isPassword) {
                bool data = AppConstants.passwordValidator.hasMatch(value);
                if (value.isEmpty) {
                  return "Please enter ${widget.hintText!.toLowerCase()}";
                } else if (!data) {
                  return "Insecure password detected.";
                }
              }
            } else {
              bool data = AppConstants.emailValidator.hasMatch(value!);
              if (value.isEmpty) {
                return "Please enter ${widget.hintText!.toLowerCase()}";
              } else if (!data) {
                return "Please check your email!";
              }
            }
            return null;
          },
      cursorColor: AppColors.subTextColor5c5c5c,

      obscureText: widget.isPassword ? obscureText : false,
      style: TextStyle(color: AppColors.hintextColorA1A1A1, fontSize: 16.h),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: widget.contentPaddingHorizontal ?? 20.w,
            vertical: widget.contentPaddingVertical ?? 20.w),
        fillColor: Colors.white,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: toggle,
                child: _suffixIcon(
                    obscureText ? Icons.visibility_off : Icons.visibility),
              )
            : widget.suffixIcon,
        prefixIconConstraints: BoxConstraints(minHeight: 24.w, minWidth: 24.w),
        labelText: widget.labelText,
        hintText: widget.hintText,

        focusedBorder: focusedBorder(),
        enabledBorder: enabledBorder()
      ),
    );
  }

  _suffixIcon(IconData icon) {
    return Padding(padding: const EdgeInsets.all(12.0), child: Icon(icon));
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide:BorderSide(
        color: widget.borderColor ?? AppColors.borderColor
      ),
    );
  }

  OutlineInputBorder enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide:BorderSide(
          color: widget.borderColor ?? AppColors.borderColor
      ),
    );
  }
}
