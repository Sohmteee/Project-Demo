// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
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
              children: [
                Container(
                  width: 145.w,
                  height: double.maxFinite,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 20,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                    child: pageIndex == 0
                        ? ShaderMask(
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
                              color: Color(0xFFFFB459),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : DMSansText(
                            'ALL EVENTS',
                            textAlign: TextAlign.center,
                            color: Color(0xFFFFB459),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
