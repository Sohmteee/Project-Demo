// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60.h,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        titleSpacing: 0.w,
        backgroundColor: Colors.transparent,
        title: AirBnBText(
          'Events',
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        padding: EdgeInsets.only(top: 90.h),
        decoration: BoxDecoration(
          color:
              (themeProvider.themeType == ThemeType.light) ? Vx.gray100 : null,
          image: (themeProvider.themeType == ThemeType.dark)
              ? const DecorationImage(
                  image:
                      AssetImage('assets/images/dark-gradient-background.png'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Column(
          children: [
            buildEventsTab(themeProvider),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 5),
                itemBuilder: (context, index) {
                  return ZoomTapAnimation(
                    onTap: () => Navigator.pushNamed(context, '/event-details'),
                    child: Container(
                      height: 112.h,
                      padding: EdgeInsets.fromLTRB(10.w, 14.h, 14.w, 14.h),
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
                              'assets/images/home/near-you-2.png',
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AirBnBText(
                                      '1ST MAY- SAT -2:00 PM',
                                      color: const Color(0xFFFFB459),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(height: 3.h),
                                    AirBnBText(
                                      'International kids safe parents night out',
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(height: 5.h),
                                    DMSansText(
                                      'FREE - \$25',
                                      textAlign: TextAlign.center,
                                      color: const Color(0xFFFFB459),
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/map-pin.svg',
                                      height: 12.h,
                                      width: 12.w,
                                    ),
                                    SizedBox(width: 5.w),
                                    DMSansText(
                                      'Radius Gallery • Santa Cruz',
                                      color: const Color(0xFF747688),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.w,
                            ),
                            child: Icon(
                              IconlyLight.bookmark,
                              size: 16.sp,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            /* const Spacer(),
            Image.asset(
              'assets/images/no-event${themeProvider.themeType == ThemeType.light ? '' : '-dark'}.png',
              width: 180.w,
              height: 180.h,
            ),
            SizedBox(height: 20.h),
            DMSansText(
              'No  Event',
              textAlign: TextAlign.center,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 12.h),
            DMSansText(
              'We couldn’t find any active\nevent in your current location',
              textAlign: TextAlign.center,
              color: Vx.gray400,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            const Spacer(flex: 2), */
          ],
        ),
      ),
    );
  }

  Container buildEventsTab(ThemeProvider themeProvider) {
    return Container(
      width: double.maxFinite,
      height: 45.h,
      margin: EdgeInsets.symmetric(
        horizontal: 40.w,
        vertical: 10.h,
      ),
      padding: EdgeInsets.all(5.sp),
      decoration: ShapeDecoration(
        color: themeProvider.themeType == ThemeType.light
            ? Colors.black.withOpacity(0.02)
            : const Color(0xED191818),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (pageIndex == 0)
              ? Container(
                  width: 145.w,
                  height: double.maxFinite,
                  decoration: ShapeDecoration(
                    color: themeProvider.themeType == ThemeType.light
                        ? Colors.white
                        : HexColor('#2C2A27'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 20,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
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
                        'ALL EVENTS',
                        textAlign: TextAlign.center,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () => setState(() {
                    pageIndex = 0;
                  }),
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: DMSansText(
                      'ALL EVENTS',
                      textAlign: TextAlign.center,
                      color: HexColor('#9B9B9B'),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
          (pageIndex == 1)
              ? Container(
                  width: 145.w,
                  height: double.maxFinite,
                  decoration: ShapeDecoration(
                    color: themeProvider.themeType == ThemeType.light
                        ? Colors.white
                        : HexColor('#2C2A27'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 20,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
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
                        'PAST EVENTS',
                        textAlign: TextAlign.center,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () => setState(() {
                    pageIndex = 1;
                  }),
                  child: Padding(
                    padding: EdgeInsets.only(right: 30.w),
                    child: DMSansText(
                      'PAST EVENTS',
                      textAlign: TextAlign.center,
                      color: HexColor('#9B9B9B'),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
