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
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/countries.dart';
import 'package:yeerlo/data.dart';
import 'package:yeerlo/models/bottomNavBar.dart';
import 'package:yeerlo/models/flag.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/registration/switch.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/notifications.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final drawerController = AdvancedDrawerController();
  final panelController = SlidingUpPanelController();
  int selectedFilterCategoryIndex = 0;
  int selectedTimeCategoryIndex = 1;
  bool isOpenDrawer = false;
  bool isOpenFilter = false;
  final timer = Timer;
  late Duration timeRemaining;

  DateTime eventDate = upcomingEvents[0]['time'];

  @override
  void initState() {
    super.initState();
    panelController.collapse();
    Timer.periodic(1.seconds, (timer) {
      setState(() {
        timeRemaining = eventDate.difference(DateTime.now());
      });
    });
    drawerController.addListener(() {
      if (mounted) {
        setState(() {
          isOpenDrawer =
              drawerController.value == AdvancedDrawerValue.visible();
        });
      }
    });
  }

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
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Theme.of(context).colorScheme.primary,
                body: buildBottomNavBar(themeProvider),
              ),
              if (panelController.status != SlidingUpPanelStatus.collapsed)
                GestureDetector(
                  onTap: () {
                    panelController.collapse();
                    setState(() {
                      isOpenFilter = false;
                    });
                  },
                  child: Container(
                    color: Colors.black38,
                  ),
                ),
              SlidingUpPanelWidget(
                panelController: panelController,
                controlHeight: 0.h,
                upperBound: .8.h,
                enableOnTap: false,
                onStatusChanged: (status) {
                  if (status == SlidingUpPanelStatus.collapsed) {
                    setState(() {
                      isOpenFilter = false;
                    });
                  } else {
                    setState(() {
                      isOpenFilter = true;
                    });
                  }
                },
                child: !isOpenFilter
                    ? const SizedBox(height: 1)
                    : Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: (themeProvider.themeType == ThemeType.light)
                              ? lightBackgroundColor
                              : darkBackgroundColor,
                          image: (themeProvider.themeType == ThemeType.dark)
                              ? const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/dark-gradient-background.png'),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(38.r),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 26.w,
                                  height: 5.h,
                                  margin: EdgeInsets.symmetric(vertical: 11.h),
                                  decoration: ShapeDecoration(
                                    color: const Color(0x7FB2B2B2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.50),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: AirBnBText(
                                      'Filter',
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                buildFilterCategories(context, themeProvider),
                                SizedBox(height: 12.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: AirBnBText(
                                          'Time & Date',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                buildTimeCategories(context, themeProvider),
                                SizedBox(height: 14.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Column(
                                    children: [
                                      buildChooseCalendar(themeProvider),
                                      SizedBox(height: 16.h),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: AirBnBText(
                                          'Location',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 12.h),
                                      buildChooseLocation(themeProvider),
                                      SizedBox(height: 24.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AirBnBText(
                                            'Select Price Range',
                                            color: themeProvider.themeType ==
                                                    ThemeType.light
                                                ? HexColor('#120D26')
                                                : Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          themeProvider.themeType ==
                                                  ThemeType.light
                                              ? AirBnBText(
                                                  '\$20-\$120',
                                                  color: HexColor('#3F38DD'),
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w400,
                                                )
                                              : ShaderMask(
                                                  blendMode: BlendMode.srcIn,
                                                  shaderCallback:
                                                      (Rect bounds) =>
                                                          LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      lightOrangeColor,
                                                      darkOrangeColor,
                                                    ],
                                                    tileMode: TileMode.mirror,
                                                  ).createShader(bounds),
                                                  child: AirBnBText(
                                                    '\$20-\$120',
                                                    color: HexColor('#3F38DD'),
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                        ],
                                      ),
                                      SizedBox(height: 15.h),
                                      buildPriceRange(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 58.h,
                                  width: 130.w,
                                  decoration: BoxDecoration(
                                      border: themeProvider.themeType ==
                                              ThemeType.light
                                          ? Border.all(
                                              width: 1,
                                              color: HexColor('#E5E5E5'),
                                            )
                                          : null,
                                      borderRadius: BorderRadius.circular(14.r),
                                      color: themeProvider.themeType ==
                                              ThemeType.light
                                          ? null
                                          : Colors.white),
                                  child: Center(
                                    child: AirBnBText(
                                      'RESET',
                                      textAlign: TextAlign.center,
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 58.h,
                                  width: 185.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.r),
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
                                      'APPLY',
                                      textAlign: TextAlign.center,
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 2),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPriceRange() {
    double width = 200.w;
    const SfRangeValues values = SfRangeValues(4, 7);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SfRangeSelector(
          min: 1,
          max: 10,
          initialValues: values,
          // labelPlacement: LabelPlacement.betweenTicks,
          interval: 1,
          // inactiveColor: Theme.of(context).colorScheme.primary,
          startThumbIcon: Container(
            // width: 35.w,
            // height: 35.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.w,
                  color: lightOrangeColor,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Icon(
              Icons.compare_arrows,
              color: Theme.of(context).colorScheme.secondary,
              size: 1.sp,
            ),
          ),

          endThumbIcon: Container(
            // width: 35.w,
            // height: 35.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.w,
                  color: lightOrangeColor,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Icon(
              Icons.compare_arrows,
              color: Theme.of(context).colorScheme.secondary,
              size: 1.sp,
            ),
          ),
          child: SizedBox(
            height: 50.h,
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                20,
                (index) => Container(
                  height: ((index / 20 * 45) + 5).h,
                  width: (width / 22).w,
                  decoration: BoxDecoration(
                    color: HexColor('#E7E7E7'),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        /* Container(
          width: double.maxFinite,
          height: 2.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                lightOrangeColor,
                darkOrangeColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ), */
      ],
    );
  }

  Container buildChooseCalendar(ThemeProvider themeProvider) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        border: themeProvider.themeType == ThemeType.light
            ? Border.all(
                width: 1,
                color: const Color(0xFFE6E6E6),
              )
            : null,
        borderRadius: BorderRadius.circular(10),
        color: themeProvider.themeType == ThemeType.light
            ? null
            : HexColor('#191818'),
      ),
      child: Center(
        child: Row(
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
              child: const Icon(
                IconlyBold.calendar,
              ),
            ),
            const Spacer(),
            AirBnBText(
              'Choose from calendar',
              textAlign: TextAlign.center,
              color: themeProvider.themeType == ThemeType.light
                  ? HexColor('#807A7A')
                  : Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            const Spacer(flex: 4),
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
              child: const Icon(
                Icons.chevron_right,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildChooseLocation(ThemeProvider themeProvider) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        border: themeProvider.themeType == ThemeType.light
            ? Border.all(
                width: 1,
                color: const Color(0xFFE6E6E6),
              )
            : null,
        borderRadius: BorderRadius.circular(10),
        color: themeProvider.themeType == ThemeType.light
            ? null
            : HexColor('#191818'),
      ),
      child: Center(
        child: Row(
          children: [
            Image.asset('assets/images/home/filter-location.png'),
            const Spacer(),
            DMSansText(
              'New York, USA',
              color: themeProvider.themeType == ThemeType.light
                  ? const Color(0xFF141736)
                  : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            const Spacer(flex: 4),
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
              child: const Icon(
                Icons.chevron_right,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildFilterCategories(
      BuildContext context, ThemeProvider themeProvider) {
    return SizedBox(
      height: (40 + 36).h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        itemBuilder: (context, index) {
          return ZoomTapAnimation(
            onTap: () {
              setState(() {
                selectedFilterCategoryIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 18.h,
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color: index == selectedFilterCategoryIndex
                    ? null
                    : themeProvider.themeType == ThemeType.light
                        ? HexColor('#E7E7E7')
                        : HexColor('#191818'),
                borderRadius: BorderRadius.circular(20),
                gradient: index == selectedFilterCategoryIndex
                    ? LinearGradient(
                        colors: [
                          lightOrangeColor,
                          darkOrangeColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x1E2E2E4E),
                    blurRadius: 20,
                    offset: Offset(0, 4.h),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    IconlyBold.calendar,
                    color: index == selectedFilterCategoryIndex
                        ? themeProvider.themeType == ThemeType.light
                            ? Colors.white
                            : Colors.black
                        : themeProvider.themeType == ThemeType.light
                            ? HexColor('#979797')
                            : Colors.white,
                  ),
                  SizedBox(width: 5.w),
                  DMSansText(
                    categories[index]['title'],
                    color: index == selectedFilterCategoryIndex
                        ? themeProvider.themeType == ThemeType.light
                            ? Colors.white
                            : Colors.black
                        : themeProvider.themeType == ThemeType.light
                            ? HexColor('#979797')
                            : Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox buildTimeCategories(
      BuildContext context, ThemeProvider themeProvider) {
    List times = [
      "Today",
      "Tomorrow",
      "This week",
    ];

    return SizedBox(
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: times.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        itemBuilder: (context, index) => ZoomTapAnimation(
          onTap: () {
            setState(() {
              selectedTimeCategoryIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: index != selectedTimeCategoryIndex &&
                      themeProvider.themeType == ThemeType.light
                  ? Border.all(
                      width: 1,
                      color: const Color(0xFFE6E6E6),
                    )
                  : null,
              gradient: index == selectedTimeCategoryIndex
                  ? LinearGradient(
                      colors: [
                        lightOrangeColor,
                        darkOrangeColor,
                      ],
                      begin: const Alignment(0, -1),
                      end: const Alignment(0, 1),
                    )
                  : null,
              color: themeProvider.themeType == ThemeType.light
                  ? null
                  : HexColor('#191818'),
            ),
            child: Center(
              child: DMSansText(
                times[index],
                color: index == selectedTimeCategoryIndex
                    ? themeProvider.themeType == ThemeType.light
                        ? Colors.white
                        : Colors.black
                    : themeProvider.themeType == ThemeType.light
                        ? HexColor('#979797')
                        : Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
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
        'onTap': () {},
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/drawer/calendar.svg',
          width: 23.w,
          height: 23.h,
          color: HexColor('#767676'),
        ),
        'title': 'My Events',
        'onTap': () {},
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/drawer/gallery.svg',
          width: 23.w,
          height: 23.h,
          color: HexColor('#767676'),
        ),
        'title': 'Gallery',
        'onTap': () {},
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
        'onTap': () {},
      },
      {
        'icon': ThemeSwitch(
          value: themeProvider.themeType == ThemeType.dark,
          onChanged: (value) {
            themeProvider.toggleTheme();
          },
        ),
        'title': 'Theme Mode',
        'onTap': () {
          themeProvider.toggleTheme();
        },
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/drawer/sign-out.svg',
          width: 23.w,
          height: 23.h,
          color: HexColor('#767676'),
        ),
        'title': 'Sign Out',
        'onTap': () {},
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
            SizedBox(
              height: drawerOptions.length * 60.h,
              child: ListView.builder(
                itemCount: drawerOptions.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: drawerOptions[index]['onTap'],
                    enableFeedback: true,
                    splashColor: Colors.transparent,
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
        child: const Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
      onPressFAB: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 9.w,
                    ),
                    // color: themeProvider.themeType == ThemeType.light
                    //     ? lightBackgroundColor
                    //     : darkBackgroundColor,
                    child: Column(
                      children: List.generate(newPopUpItems.length, (index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.w,
                            vertical: 16.h,
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 7.h,
                          ),
                          decoration: BoxDecoration(
                            color: newPopUpItems[index]['background-color'],
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                IconlyBroken.calendar,
                                size: 38.sp,
                                color: newPopUpItems[index]['icon-color'],
                              ),
                              SizedBox(width: 18.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DMSansText(
                                      newPopUpItems[index]['title'],
                                      color: const Color(0xFF171766),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    DMSansText(
                                      newPopUpItems[index]['subtitle'],
                                      color: const Color(0xFF757575),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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
                  buildNearYou(themeProvider),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: ArrowButton(
                      text: 'EXPLOR MORE EVENTS',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 30.h),
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

  Column buildNearYou(ThemeProvider themeProvider) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Row(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/nearby-events');
                    },
                    child: const Row(
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
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: (145 * 3).h,
          child: ListView.builder(
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemBuilder: (context, index) {
              bool isFavourite = index == 0 ? true : false;
              return Container(
                height: 128.h,
                padding: EdgeInsets.all(10.sp),
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
                        'assets/images/home/near-you-${index + 1}.png',
                        width: 79.w,
                        height: 108.h,
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
                                'Women\'s leadership conference',
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
                    Row(
                      children: [
                        (index == 1)
                            ? Image.asset(
                                'assets/images/home/google-meet-icon.png',
                                height: 16.h,
                                width: 16.w,
                              )
                            : Image.asset(
                                'assets/images/home/zoom-icon.png',
                                height: 16.h,
                                width: 16.w,
                                fit: BoxFit.contain,
                              ),
                        ZoomTapAnimation(
                          onTap: () {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 8.w,
                            ),
                            child: Icon(
                              isFavourite
                                  ? IconlyBold.bookmark
                                  : IconlyLight.bookmark,
                              size: 16.sp,
                              color: isFavourite
                                  ? HexColor('#EB5757')
                                  : Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        )
                      ],
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/upcoming-events');
                },
                child: Row(
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
              timeRemaining = eventDate.difference(DateTime.now());

              int daysDifference = timeRemaining.inDays;
              int hoursDifference = timeRemaining.inHours % 24;
              int minutesDifference = timeRemaining.inMinutes % 60;
              int secondsDifference = timeRemaining.inSeconds % 60;

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
                              Image.asset(
                                width: 16.w,
                                height: 16.h,
                                'assets/images/home/google-meet-icon.png',
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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
          child: SvgPicture.asset(
            'assets/svg/search.svg',
          ),
        ),

        //textfield
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Vx.gray300,
                  fontSize: 20.sp,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        //filter button
        ZoomTapAnimation(
          onTap: () {
            setState(() {
              isOpenFilter = true;
            });
            panelController.expand();
          },
          child: Container(
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
        ),
      ],
    );
  }

  Row buildTopAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ZoomTapAnimation(
          onTap: () {
            FocusScope.of(context).unfocus();
            drawerController.toggleDrawer();
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(5.sp),
            child: isOpenDrawer
                ? Icon(
                    Icons.close,
                    color: lightBackgroundColor,
                    size: 25.sp,
                  )
                : SvgPicture.asset("assets/svg/drawer.svg"),
          ),
        ),
        Column(
          children: [
            SizedBox(
              width: 200,
              child: DropdownButton(
                isExpanded: true,
                isDense: true,
                dropdownColor: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10.r),
                menuMaxHeight: 400.h,
                icon: Container(),
                hint: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                items: countryList
                    .map(
                      (country) => DropdownMenuItem(
                        value: country,
                        child: Row(
                          children: [
                            CountriesFlag(
                              getFlagPath(country['name']),
                              width: 25.w,
                              height: 18.h,
                              placeholderBuilder: (context) {
                                return Container(
                                  width: 20.w,
                                  height: 15.h,
                                  color: Colors.grey,
                                );
                              },
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: AirBnBText(
                                country['name'].toString().split('.').last,
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (country) {
                  setState(() {
                    selectedCountry = country!;
                  });
                },
                underline: Container(),
              ),
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
        ZoomTapAnimation(
          onTap: () {
            final provider =
                Provider.of<NotificationProvider>(context, listen: false);
            provider.showNoNotification();
            Navigator.pushNamed(context, '/notifications');
          },
          onLongTap: () {
            final provider =
                Provider.of<NotificationProvider>(context, listen: false);
            provider.showNotifications();
            Navigator.pushNamed(context, '/notifications');
          },
          child: SvgPicture.asset("assets/svg/notification-bell.svg"),
        ),
      ],
    );
  }
}
