// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
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
          'My Tickets',
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/search.svg',
              color: Theme.of(context).colorScheme.secondary,
              height: 24.sp,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          itemBuilder: (context, index) {
            return Container(
              height: 112.h,
              padding: EdgeInsets.fromLTRB(10.sp, 10.sp, 15.sp, 10.sp),
              margin: EdgeInsets.symmetric(vertical: 7.h),
              decoration: BoxDecoration(
                color: themeProvider.themeType == ThemeType.light
                    ? lightBackgroundColor
                    : darkBackgroundColor,
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0F4F5588),
                    blurRadius: 30,
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      'assets/images/home/near-you-1.png',
                      width: 79.w,
                      height: 92.h,
                    ),
                  ),
                  SizedBox(width: 18.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AirBnBText(
                          'Women\'s leadership conference',
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 3.h),
                        AirBnBText(
                          'VIP X2',
                          color: const Color(0xFFFFB459),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 5.h),
                        DMSansText(
                          '12th June, 2023',
                          textAlign: TextAlign.center,
                          color: HexColor('#747688'),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {
                          Navigator.pushNamed(context, '/view-ticket');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 6.h,
                          ),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0, -1),
                              end: const Alignment(0, 1),
                              colors: [
                                lightOrangeColor.withOpacity(.12),
                                darkOrangeColor.withOpacity(.12),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.r)),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x144AD2E4),
                                blurRadius: 20,
                                offset: Offset(0, 8),
                                spreadRadius: 0,
                              )
                            ],
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
                              'View',
                              textAlign: TextAlign.center,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
