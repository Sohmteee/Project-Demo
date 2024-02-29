import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/drawer/profile/profile.png',
              width: 96.w,
              height: 96.h,
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    Navigator.pushNamed(context, '/wallet');
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(34.w, 12.h, 37.w, 12.h),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      gradient: LinearGradient(
                        colors: [
                          lightOrangeColor,
                          darkOrangeColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/drawer/profile/dollar.svg',
                          width: 21.w,
                          height: 21.h,
                        ),
                        SizedBox(width: 16.w),
                        DMSansText(
                          'Wallet',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(18.w, 12.h, 36.w, 12.h),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [
                            lightOrangeColor,
                            darkOrangeColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          lightOrangeColor,
                          darkOrangeColor,
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds),
                      child: DMSansText(
                        'Settings',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
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