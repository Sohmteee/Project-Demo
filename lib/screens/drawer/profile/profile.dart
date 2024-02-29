import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        titleSpacing: 0.w,
        backgroundColor: Colors.transparent,
        title: AirBnBText(
          'Profile',
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              buildTopProfile(context),
              SizedBox(height: 27.h),
              buildAbout(themeProvider),
              SizedBox(height: 45.h),
              buildInterests(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildTopProfile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/drawer/profile/profile.png',
          width: 96.w,
          height: 96.h,
        ),
        SizedBox(height: 20.h),
        AirBnBText(
          'Ashfak Sayem',
          fontWeight: FontWeight.w500,
          fontSize: 24.sp,
        ),
        SizedBox(height: 7.h),
        AirBnBText(
          '@ashfak',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        SizedBox(height: 18.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                AirBnBText(
                  '350',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                AirBnBText(
                  'Following',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.grey[400],
                ),
              ],
            ),
            SizedBox(width: 20.w),
            Container(
              width: 1.w,
              height: 32.h,
              color: Colors.grey[400],
            ),
            SizedBox(width: 20.w),
            Column(
              children: [
                AirBnBText(
                  '346',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                AirBnBText(
                  'Followers',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 18.h),
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
                Navigator.pushNamed(context, '/wallet');
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
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/drawer/profile/settings.svg',
                        width: 21.w,
                        height: 21.h,
                      ),
                      SizedBox(width: 16.w),
                      DMSansText(
                        'Settings',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding buildAbout(ThemeProvider themeProvider) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AirBnBText(
            'About Me',
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
          SizedBox(height: 10.h),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'Enjoy your favorite comedy show with lovely  friends and family and have a great time.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' Read More',
                  style: TextStyle(
                    color: themeProvider.themeType == ThemeType.light
                        ? lightOrangeColor
                        : darkOrangeColor,
                    fontSize: 16.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildInterests() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AirBnBText(
              'Interests',
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    lightOrangeColor.withOpacity(.1),
                    darkOrangeColor.withOpacity(.1),
                  ],
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/drawer/profile/edit.svg',
                    width: 13.w,
                    height: 13.h,
                  ),
                  SizedBox(width: 6.w),
                  ShaderMask(
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
                    child: AirBnBText(
                      'CHANGE',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: Chip(
                color: MaterialStateColor.resolveWith(
                    (states) => HexColor('#6B7AED')),
                label: AirBnBText(
                  'Games Online',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: Chip(
                color: MaterialStateColor.resolveWith(
                    (states) => HexColor('#EE544A')),
                label: AirBnBText(
                  'Concert',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: Chip(
                color: MaterialStateColor.resolveWith(
                    (states) => HexColor('#FF8D5D')),
                label: AirBnBText(
                  'Music',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: Chip(
                color: MaterialStateColor.resolveWith(
                    (states) => HexColor('#7D67EE')),
                label: AirBnBText(
                  'Art',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: Chip(
                color: MaterialStateColor.resolveWith(
                    (states) => HexColor('#29D697')),
                label: AirBnBText(
                  'Movie',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: Chip(
                color: MaterialStateColor.resolveWith(
                    (states) => HexColor('#39D1F2')),
                label: AirBnBText(
                  'Others',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
