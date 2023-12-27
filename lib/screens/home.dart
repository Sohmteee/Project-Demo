// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:blur/blur.dart';
import 'package:countries_flag/countries_flag.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/countries.dart';
import 'package:yeerlo/data.dart';
import 'package:yeerlo/models/bottomNavBar.dart';
import 'package:yeerlo/models/flag.dart';
import 'package:yeerlo/models/registration/switch.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final drawerController = AdvancedDrawerController();
  bool isOpenDrawer = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: (themeProvider.themeType == ThemeType.light)
              ? lightBackgroundColor
              : null,
          image: (themeProvider.themeType == ThemeType.dark)
              ? const DecorationImage(
                  image:
                      AssetImage('assets/images/dark-gradient-background.png'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: AdvancedDrawer(
          controller: drawerController,
          disabledGestures: true,
          animationDuration: 300.milliseconds,
          backdropColor: Colors.transparent,
          drawer: buildDrawerItems(themeProvider),
          childDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: const [
              BoxShadow(
                offset: Offset(-15, 0),
                color: Color(0x3FBCBCBC),
                blurRadius: 10,
              ),
              /* BoxShadow(
                offset: Offset(-30, 0),
                color: Color(0x3FBCBCBC),
                blurRadius: 10,
              ), */
            ],
          ),
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: buildBottomNavBar(themeProvider),
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItems(ThemeProvider themeProvider) {
    List drawerOptions = [
      {
        'icon': SvgPicture.asset(
          'assets/svg/drawer/user.svg',
          width: 23.w,
          height: 23.h,
        ),
        'title': 'My Profile',
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/drawer/calendar.svg',
          width: 23.w,
          height: 23.h,
          color: HexColor('#767676'),
        ),
        'title': 'My Events',
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/drawer/gallery.svg',
          width: 23.w,
          height: 23.h,
          color: HexColor('#767676'),
        ),
        'title': 'Gallery',
      },
      {
        'icon': Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              'assets/svg/drawer/user.svg',
              width: 23.w,
              height: 23.h,
              color: HexColor('#767676'),
            ),
            Positioned(
              top: 0,
              right: -4,
              child: SvgPicture.asset(
                'assets/svg/drawer/user-small.svg',
                width: 18.w,
                height: 18.h,
                color: HexColor('#767676'),
              ),
            ),
          ],
        ),
        'title': 'Find Friends',
      },
      {
        'icon': ThemeSwitch(
          value: themeProvider.themeType == ThemeType.dark,
          onChanged: (value) {
            themeProvider.toggleTheme();
          },
        ),
        'title': 'Theme Mode',
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/drawer/sign-out.svg',
          width: 23.w,
          height: 23.h,
          color: HexColor('#767676'),
        ),
        'title': 'Sign Out',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000.r),
                  child: FastCachedImage(
                    width: 60.w,
                    height: 60.w,
                    url: profilePath,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(seconds: 1),
                    errorBuilder: (context, exception, stacktrace) {
                      return Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                    loadingBuilder: (context, progress) {
                      return Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ).animate().shimmer(
                            delay: 1.seconds,
                          );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Ashfak Sayem',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: drawerOptions.length * 60.h,
              color: Colors.grey,
              child: ListView.builder(
                itemCount: drawerOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: drawerOptions[index]['icon'],
                    title: Text(
                      drawerOptions[index]['title'],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18.sp,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(flex: 7),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: themeProvider.themeType == ThemeType.light
                    ? cyanBackgroundColor
                    : const Color(0x3300F8FF),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/svg/drawer/crown.svg'),
                  SizedBox(width: 10.w),
                  Text(
                    'Upgrade Pro',
                    style: TextStyle(
                      color: cyanTextColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  BottomNavBar buildBottomNavBar(ThemeProvider themeProvider) {
    return BottomNavBar(
      bottomNavBarColor: themeProvider.themeType == ThemeType.light
          ? lightBackgroundColor
          : darkBackgroundColor,
      bottomNavItemIconHeight: 20.h,
      bottomNavItemLabelHeight: 15.h,
      bottomNavItemHeight: 50.h,
      fabWidth: 50.w,
      fabIcon: Container(
        height: 54.h,
        width: 54.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              lightOrangeColor,
              darkOrangeColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.add_box,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      bottomItems: [
        BottomBarItem(
          icon: SvgPicture.asset(
            'assets/svg/compass.svg',
            height: 23.h,
            width: 23.w,
          ),
          label: 'Explore',
          bottomItemSelectedColor: darkOrangeColor,
          screen: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            appBar: buildAppBar(themeProvider),
            extendBodyBehindAppBar: true,
            body: Container(
              decoration: BoxDecoration(
                color: (themeProvider.themeType == ThemeType.light)
                    ? lightBackgroundColor
                    : null,
                image: (themeProvider.themeType == ThemeType.dark)
                    ? const DecorationImage(
                        image: AssetImage(
                            'assets/images/dark-gradient-background.png'),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 40.h),
                  buildUpcomingEvents(themeProvider),
                  SizedBox(height: 20.h),
                  buildReferral(themeProvider),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Near You',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Row(
                          children: [
                            Text(
                              'See All',
                              style: TextStyle(
                                color: linkTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: linkTextColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        BottomBarItem(
          icon: Icon(
            IconlyBold.calendar,
            color: Vx.gray400,
            size: 23.w,
          ),
          label: 'Calendar',
          screen: Container(),
        ),
        BottomBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bookmark.svg',
            color: Vx.gray400,
            height: 23.h,
            width: 23.w,
          ),
          label: 'Bookmarks',
          screen: Container(),
        ),
        BottomBarItem(
          icon: SvgPicture.asset(
            'assets/svg/ticket.svg',
            color: Vx.gray400,
            height: 23.h,
            width: 23.w,
          ),
          label: 'My Tickets',
          screen: Container(),
        ),
      ],
    );
  }

  Widget buildReferral(ThemeProvider themeProvider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 150.h,
          decoration: BoxDecoration(
            color: themeProvider.themeType == ThemeType.light
                ? lightBlueBackgroundColor
                : darkBackgroundColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -30.w,
                bottom: -70.h,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-0.18),
                  child: Image.asset(
                    'assets/images/invite.png',
                    width: 245.34.w,
                    height: 203.h,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 130.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Invite your friends',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Refer an event creator and earn '
                              '\n50% of proceeds from each '
                              '\nticket sale for 2 years.',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(.7),
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 72.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            gradient: LinearGradient(
                              colors: [
                                lightOrangeColor,
                                darkOrangeColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Center(
                            child: AirBnBText(
                              'INVITE',
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildUpcomingEvents(ThemeProvider themeProvider) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AirBnBText(
                'Upcoming Events',
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  AirBnBText(
                    'See All',
                    color: linkTextColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: linkTextColor,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10.sp),
            physics: const BouncingScrollPhysics(),
            itemCount: upcomingEvents.length,
            itemBuilder: (BuildContext context, int index) {
              DateTime eventDate = upcomingEvents[index]['time'];
              Duration timeRemaining = eventDate.difference(DateTime.now());

              int daysDifference = timeRemaining.inDays;
              int hoursDifference = timeRemaining.inHours % 24;
              int minutesDifference = timeRemaining.inMinutes % 60;
              int secondsDifference = timeRemaining.inSeconds % 60;

              // Timer timer;

              Timer.periodic(1.seconds, (timer) {
                setState(() {
                  timeRemaining = eventDate.difference(DateTime.now());
                });
              });
              return Container(
                width: 240,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  color: themeProvider.themeType == ThemeType.light
                      ? lightBackgroundColor
                      : darkBackgroundColor,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: FastCachedImage(
                            url: upcomingEvents[index]['image'],
                            width: 218.w,
                            height: 131.h,
                            fit: BoxFit.cover,
                            fadeInDuration: const Duration(seconds: 1),
                            errorBuilder: (context, exception, stacktrace) {
                              return Container(
                                width: 218.w,
                                height: 131.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              );
                            },
                            loadingBuilder: (context, progress) {
                              return Container(
                                width: 218.w,
                                height: 131.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ).animate().shimmer(
                                    delay: 1.seconds,
                                  );
                            },
                          ),
                        ),
                        Positioned(
                          top: 10.h,
                          left: 10.w,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Blur(
                                blur: 3,
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container(
                                  height: 50.h,
                                  width: 50.w,
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  DMSansText(
                                    eventDate.day.toString(),
                                    color: upcomingEvents[index]['date-color'],
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  DMSansText(
                                    switch (eventDate.month) {
                                      1 => 'JAN',
                                      2 => 'FEB',
                                      3 => 'MAR',
                                      4 => 'APR',
                                      5 => 'MAY',
                                      6 => 'JUNE',
                                      7 => 'JUL',
                                      8 => 'AUG',
                                      9 => 'SEP',
                                      10 => 'OCT',
                                      11 => 'NOV',
                                      12 => 'DEC',
                                      _ => ''
                                    },
                                    color: upcomingEvents[index]['date-color'],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10.h,
                          right: 10.w,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Blur(
                                blur: 3,
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/svg/bookmark.svg',
                                width: 14.w,
                                height: 14.h,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10.h,
                          left: 10.w,
                          child: SizedBox(
                            width: 196.w,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Blur(
                                  blur: 3,
                                  borderRadius: BorderRadius.circular(10.r),
                                  blurColor: Colors.grey.withOpacity(.1),
                                  child: Container(
                                    height: 35.h,
                                    width: 196.w,
                                    padding: EdgeInsets.all(5.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        DMSansText(
                                          daysDifference.toString(),
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        DMSansText(
                                          "Days",
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        DMSansText(
                                          hoursDifference.toString(),
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        DMSansText(
                                          "Hours",
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        DMSansText(
                                          minutesDifference.toString(),
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        DMSansText(
                                          "Minutes",
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        DMSansText(
                                          secondsDifference.toString(),
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        DMSansText(
                                          "Seconds",
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(6.w, 10.h, 6.w, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                child: DMSansText(
                                  upcomingEvents[index]['price'],
                                  textAlign: TextAlign.center,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              FastCachedImage(
                                width: 16.w,
                                height: 16.h,
                                url: googleMeetPath,
                                fadeInDuration: const Duration(seconds: 1),
                                errorBuilder: (context, exception, stacktrace) {
                                  return Container(
                                    width: 16.w,
                                    height: 16.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(
                                        10.r,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                                loadingBuilder: (context, progress) {
                                  return Container(
                                    width: 16.w,
                                    height: 16.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(
                                        10.r,
                                      ),
                                    ),
                                  ).animate().shimmer(
                                        delay: 1.seconds,
                                      );
                                },
                              ),
                            ],
                          ),
                          AirBnBText(
                            upcomingEvents[index]['title'],
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10.h),
                          buildGoingRow(),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/map-pin.svg',
                                height: 16.h,
                                width: 16.w,
                              ),
                              SizedBox(width: 5.w),
                              Expanded(
                                child: AirBnBText(
                                  upcomingEvents[index]['location'],
                                  color: linkTextColor,
                                  fontSize: 13.sp,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Row buildGoingRow() {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 40.w,
              child: Container(
                padding: EdgeInsets.all(2.sp),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000.r),
                  child: FastCachedImage(
                    width: 24.w,
                    height: 24.w,
                    url: dp3Path,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(seconds: 1),
                    errorBuilder: (context, exception, stacktrace) {
                      return Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      );
                    },
                    loadingBuilder: (context, progress) {
                      return Container(
                        width: 22.w,
                        height: 22.w,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ).animate().shimmer(
                            delay: 1.seconds,
                          );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.w,
              child: Container(
                padding: EdgeInsets.all(2.sp),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000.r),
                  child: FastCachedImage(
                    width: 24.w,
                    height: 24.w,
                    url: dp2Path,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(seconds: 1),
                    errorBuilder: (context, exception, stacktrace) {
                      return Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      );
                    },
                    loadingBuilder: (context, progress) {
                      return Container(
                        width: 22.w,
                        height: 22.w,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ).animate().shimmer(
                            delay: 1.seconds,
                          );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.all(2.sp),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000.r),
                  child: FastCachedImage(
                    width: 24.w,
                    height: 24.w,
                    url: dp1Path,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(seconds: 1),
                    errorBuilder: (context, exception, stacktrace) {
                      return Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      );
                    },
                    loadingBuilder: (context, progress) {
                      return Container(
                        width: 22.w,
                        height: 22.w,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ).animate().shimmer(
                            delay: 1.seconds,
                          );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 50.w),
        Text(
          '+ 20 Going',
          style: TextStyle(
            color: const Color(0xFF3F38DD),
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  buildAppBar(ThemeProvider themeProvider) {
    return PreferredSize(
      preferredSize: Size.fromHeight(200.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180.h,
            decoration: BoxDecoration(
              color: (themeProvider.themeType == ThemeType.dark)
                  ? Colors.black
                  : null,
              gradient: (themeProvider.themeType == ThemeType.light)
                  ? LinearGradient(
                      colors: [
                        lightOrangeColor,
                        darkOrangeColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : null,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(33.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 0),
              child: Column(
                children: [
                  buildTopAppBar(),
                  SizedBox(height: 10.h),
                  buildSearchBar(themeProvider),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -20.h,
            child: SizedBox(
              height: 40.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: categories[index]['color'],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        IconlyBold.calendar,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5.w),
                      DMSansText(
                        categories[index]['title'],
                        color: Colors.white,
                        fontSize: 20.r,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildSearchBar(ThemeProvider themeProvider) {
    return Row(
      children: [
        //search button
        SvgPicture.asset('assets/svg/search.svg'),

        //textfield
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Vx.gray300,
                  fontSize: 22.sp,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        //filter button
        Container(
          padding: EdgeInsets.fromLTRB(5.w, 5.h, 10.w, 5.h),
          decoration: BoxDecoration(
            color: themeProvider.themeType == ThemeType.light
                ? Colors.white
                : const Color(0xFF302F2F),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/filter-circle.svg'),
              SizedBox(width: 5.w),
              Text(
                'Filter',
                style: TextStyle(
                  color: themeProvider.themeType == ThemeType.light
                      ? darkOrangeColor
                      : Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildTopAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            drawerController.toggleDrawer();
            setState(() {
              isOpenDrawer = !isOpenDrawer;
            });
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(5.sp),
            child: isOpenDrawer
                ? const Icon(
                    Icons.close,
                    color: lightBackgroundColor,
                  )
                : SvgPicture.asset("assets/svg/drawer.svg"),
          ),
        ),
        Column(
          children: [
            const Row(
              children: [
                Text(
                  'Current Location',
                  style: TextStyle(
                    color: Vx.gray200,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Vx.white,
                )
              ],
            ),
            Row(
              children: [
                AirBnBText(
                  selectedCountry['code'].toString().split('.').last == 'US'
                      ? 'USA'
                      : selectedCountry['code'].toString().split('.').last,
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(width: 5.w),
                CountriesFlag(
                  getFlagPath(selectedCountry['name']),
                  width: 25.w,
                  height: 18.h,
                ),
              ],
            ),
          ],
        ),
        SvgPicture.asset("assets/svg/notification-bell.svg"),
      ],
    );
  }
}
