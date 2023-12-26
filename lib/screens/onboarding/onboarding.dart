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
  List onBoardingData = [
    {
      'image': 'assets/images/onboarding/onb-1.png',
      'title': 'Uncover and Explore Local \nEvents',
      'description':
          'Your gateway to local adventure! \nDiscover exciting happenings right \nin your area',
    },
    {
      'image': 'assets/images/onboarding/onb-2.png',
      'title': 'Book Tickets and Check-in \nPasses',
      'description':
          'Book tickets to your favorite events \nand get check-in passes right on \nyour phone',
    },
    {
      'image': 'assets/images/onboarding/onb-3.png',
      'title': 'Navigate to Your \nDestination with Ease',
      'description':
          'Get notified of upcoming events \nand stay up to date with your \nbookings',
    },
  ];

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
              const Spacer(flex: 2),
            ],
          ),
          Container(
            padding: EdgeInsets.all(40.sp),
            width: double.infinity,
            height: 250.h,
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
                const Spacer(),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10.w),
                            width: 8.sp,
                            height: 8.sp,
                            decoration: BoxDecoration(
                              color: (index == 0)
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.50),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          );
                        },
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
