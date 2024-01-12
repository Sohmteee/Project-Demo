// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    int pageIndex = 0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60.h,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        titleSpacing: 0.w,
        // backgroundColor: Colors.transparent,
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
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 45.h,
            margin: EdgeInsets.symmetric(
              horizontal: 40.w,
              vertical: 10.h,
            ),
            padding: EdgeInsets.all(5.sp),
            decoration: ShapeDecoration(
              color: Colors.black.withOpacity(0.02),
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
                          color: Colors.white,
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
                    : Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: DMSansText(
                          'ALL EVENTS',
                          textAlign: TextAlign.center,
                          color: HexColor('#9B9B9B'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                (pageIndex == 1)
                    ? Container(
                        width: 145.w,
                        height: double.maxFinite,
                        decoration: ShapeDecoration(
                          color: Colors.white,
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
                    : Padding(
                        padding: EdgeInsets.only(right: 30.w),
                        child: DMSansText(
                          'PAST EVENTS',
                          textAlign: TextAlign.center,
                          color: HexColor('#9B9B9B'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ],
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/images/no-event.png',
            width: 200.w,
            height: 200.h,
          ),
          SizedBox(height: 20.h),
          DMSansText(
    'No  Event',
    textAlign: TextAlign.center,
        color: Color(0xFF110C26),
        fontSize: 24,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w700,
        height: 0,
    ),
),
          Spacer(),
        ],
      ),
    );
  }
}
