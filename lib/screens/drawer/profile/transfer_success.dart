import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeerlo/colors/app_colors.dart';

class TransferSuccessScreen extends StatelessWidget {
  const TransferSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightOrangeColor,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Wallet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16.66.w, 50.h, 16.66, 60.h),
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 38.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  'assets/svg/drawer/profile/wallet/gradient-circle.svg',
                  width: 160.w,
                  height: 153.h,
                ),
                Positioned(
                  left: 42.w,
                  bottom: 39.h,
                  child: SvgPicture.asset(
                    'assets/svg/drawer/profile/wallet/done.svg',
                    width: 80.w,
                    height: 60.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
