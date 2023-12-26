import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';

class RegistrationTextField extends StatefulWidget {
  const RegistrationTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
  });

  final String hintText;
  final IconData icon;
  final TextEditingController? controller;

  @override
  State<RegistrationTextField> createState() => _RegistrationTextFieldState();
}

class _RegistrationTextFieldState extends State<RegistrationTextField> {
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
          Icon(
            IconlyLight.hide, // IconlyLight.show
            size: 22.sp,
            color: registrationIconColor,
          ),
        ],
      ),
    );
  }
}
