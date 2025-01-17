import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/screens/get_ticket.dart';

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
            SizedBox(height: 35.h),
            AirBnBText(
              'Transfer Success',
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: DMSansText(
                'Your money has been successfully sent to Nayantara V.',
                color: Colors.grey[400],
                fontSize: 12.6.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 35.h),
            DMSansText(
              'Total Transfer',
              color: Colors.grey[400],
              fontSize: 12.6.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            AirBnBText(
              '\$132.00',
              color: Colors.black,
              fontSize: 35.28.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 47.28.h),
            SizedBox(height: 16.h),
            DashDivider(
              color: HexColor('#E0E0E0'),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DMSansText(
                      'Recipient',
                      color: Colors.grey[400],
                      fontSize: 12.6.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    DMSansText(
                      'Samuel Emenike',
                      color: Colors.black,
                      fontSize: 12.6.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(flex: 2),
            ArrowButton(
              text: 'DONE',
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName('/wallet'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
