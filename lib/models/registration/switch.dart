// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';

class AppSwitch extends StatefulWidget {
  AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  bool value;
  final Function(bool?) onChanged;

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
          widget.onChanged(widget.value);
        });
      },
      child: AnimatedContainer(
        duration: 0.2.seconds,
        width: 32.w,
        height: 20.h,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(95.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              lightOrangeColor,
              darkOrangeColor,
            ],
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedPositioned(
              duration: 0.2.seconds,
              curve: Curves.easeIn,
              left: widget.value ? 12.w : 0,
              child: Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.white,
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

class ThemeSwitch extends StatefulWidget {
  ThemeSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  bool value;
  final Function(bool?) onChanged;

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
          widget.onChanged(widget.value);
        });
      },
      child: AnimatedContainer(
        duration: 0.2.seconds,
        width: 32.w,
        height: 20.h,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(95.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              lightOrangeColor,
              darkOrangeColor,
            ],
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedPositioned(
              duration: 0.2.seconds,
              curve: Curves.easeIn,
              left: widget.value ? 12.w : 0,
              child: Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.white,
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

