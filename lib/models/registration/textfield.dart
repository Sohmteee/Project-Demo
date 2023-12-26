import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.isPassword = false,
  });

  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: HexColor('#E4DFDF'),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Icon(
            widget.icon,
            size: 22.sp,
            color: registrationIconColor,
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              cursorColor: darkOrangeColor,
              obscureText: widget.isPassword ? !showPassword : false,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: linkTextColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 20.h,
                ),
              ),
            ),
          ),
          if (widget.isPassword)
            GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: Icon(
                showPassword ? IconlyLight.show : IconlyLight.hide,
                size: 22.sp,
                color: registrationIconColor,
              ),
            ),
        ],
      ),
    );
  }
}
