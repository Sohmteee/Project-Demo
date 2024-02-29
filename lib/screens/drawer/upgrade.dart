import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';

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
            padding: EdgeInsets.symmetric(
              horizontal: 22.8.w,
              vertical: 26.h,
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
                Image.asset(
                  'assets/images/drawer/upgrade/upgrade.png',
                ),
                SizedBox(height: 8.h),
                DMSansText(
                  'Yeerlo Premium for \$60/year',
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
