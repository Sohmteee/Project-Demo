// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';

/// AppSwitch is a custom StatefulWidget that implements a toggle switch UI component.
///
/// It contains a [value] bool property to represent the state of the switch,
/// and an [onChanged] callback that is invoked when the switch is toggled.
///
/// AppSwitch manages its own state internally via [State] to handle animations
/// and updating the UI when the switch is toggled.
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

/// ThemeSwitch widget to switch between light and dark themes.
/// Extends [StatefulWidget] and manages state to handle theme changes.
class ThemeSwitch extends StatefulWidget {
  ThemeSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  /// Indicates if the switch is on or off.
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
          border: Border.all(
            color: HexColor('#767676'),
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
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: Colors.white,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
