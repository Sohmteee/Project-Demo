import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/models/text.dart';

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
    return Container(
      width: 270.w,
      height: 58.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFA451),
            Color(0xFFFF7643),
          ],
        ),
      ),
      child: Stack(
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
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              width: 35.w,
              height: 35.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
