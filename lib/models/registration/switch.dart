import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({super.key});

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSwitched = !isSwitched;
        });
      },
      child: Container(
        width: 32.w,
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(95.r),
          border: Border.all(
            color: darkOrangeColor,
            width: 1.w,
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: 0.2.seconds,
              curve: Curves.easeIn,
              left: isSwitched ? 12.w : 0,
              child: Container(
                width: 20.w,
                height: 20.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: darkOrangeColor,
                  borderRadius: BorderRadius.circular(95.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
