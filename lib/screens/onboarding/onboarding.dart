import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';

class OnbaordingScreen extends StatefulWidget {
  const OnbaordingScreen({super.key});

  @override
  State<OnbaordingScreen> createState() => _OnbaordingScreenState();
}

class _OnbaordingScreenState extends State<OnbaordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              const Spacer(),
              Image.asset('assets/images/onboarding/onb-1.png'),
              const Spacer(flex: 3),
            ],
          ),
          Container(
            padding: EdgeInsets.all(40.sp),
            width: double.infinity,
            height: 270.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40.r),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lightOrangeColor,
                  darkOrangeColor,
                ],
              ),
            ),
            child: Column(
              children: [
                DMSansText(
                  'Uncover and Explore Local \nEvents',
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                DMSansText(
                  'Your gateway to local adventure! '
                  '\nDiscover exciting happenings right '
                  '\nin your area',
                  color: Colors.white,
                  fontSize: 15.sp,
                  textAlign: TextAlign.center,
                  height: 1.8,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.50,
                      child: AirBnBText(
                        'Skip',
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        height: 0.10.h,
                      ),
                    ),
                    AirBnBText(
                      'Next',
                      textAlign: TextAlign.right,
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      height: 0.10.h,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
