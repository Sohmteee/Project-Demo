import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onPressed,
      child: Container(
        width: 270.w,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              lightOrangeColor,
              darkOrangeColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 30.r,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: AirBnBText(
                text,
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                // letterSpacing: 1,
              ),
            ),
            Positioned(
              right: 14.w,
              child: SvgPicture.asset('assets/svg/button-arrow.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginOption extends StatelessWidget {
  const LoginOption({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onPressed,
      child: Container(
        width: 270.w,
        height: 58.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 30.r,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: AirBnBText(
            text,
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            // letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
