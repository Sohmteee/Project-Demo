import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({super.key});

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(95.r),
        border: Border.all(
          color: lightOrangeColor,
          width: 1.w,
        ),
      ),
    );
  }
}