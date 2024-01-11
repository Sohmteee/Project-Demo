// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class UpcomingEventsScreen extends StatefulWidget {
  const UpcomingEventsScreen({super.key});

  @override
  State<UpcomingEventsScreen> createState() => _UpcomingEventsScreenState();
}

class _UpcomingEventsScreenState extends State<UpcomingEventsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        titleSpacing: 0.w,
        backgroundColor: Vx.gray100,
        title: AirBnBText(
          'Upcoming Events',
          color: HexColor('#120D26'),
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          SvgPicture.asset(
            'assets/svg/search-orange.svg',
            color: Colors.black,
            width: 24.w,
            height: 24.h,
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
      backgroundColor: Vx.gray100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Expanded(
          child: ListView.builder(
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 112.h,
                padding: EdgeInsets.all(14.sp),
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
                                color: Theme.of(context).colorScheme.secondary,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
