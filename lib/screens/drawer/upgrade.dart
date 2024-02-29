import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class UpgradeScreen extends StatelessWidget {
  const UpgradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              lightOrangeColor,
              darkOrangeColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              22.8.w,
              26.h,
              22.8.w,
              0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DMSansText(
                      'Yeerlo',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Image.asset(
                        'assets/images/drawer/upgrade/upgrade.png',
                      ),
                      SizedBox(height: 8.h),
                      DMSansText(
                        'Yeerlo Premium for \n\$60/year',
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 21.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DMSansText(
                            '1. ',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Expanded(
                            child: DMSansText(
                              'Event Livestreaming to Youtube and Twitch',
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 11.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DMSansText(
                            '2. ',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Expanded(
                            child: DMSansText(
                              'Dedicated Customer Support',
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 11.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DMSansText(
                            '3. ',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Expanded(
                            child: DMSansText(
                              'Vendors',
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 11.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DMSansText(
                            '4. ',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Expanded(
                            child: DMSansText(
                              'Targeted EventMarketing (market to attendees in your event location)',
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'Email Marketing',
                            'Push Notification',
                            'Social Media Integration'
                          ]
                              .map(
                                (item) => DMSansText(
                                  '. $item',
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 11.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DMSansText(
                            '5. ',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Expanded(
                            child: DMSansText(
                              'Personalized Domain Name',
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      ZoomTapAnimation(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: AirBnBText(
                              'Get Started',
                              color: darkOrangeColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
