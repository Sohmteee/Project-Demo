// ignore_for_file: deprecated_member_use

import 'package:countries_flag/countries_flag.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/countries.dart';
import 'package:yeerlo/data.dart';
import 'package:yeerlo/models/bottomNavBar.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/models/flag.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final drawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: AdvancedDrawer(
        controller: drawerController,
        backdropColor: Theme.of(context).colorScheme.primary,
        drawer: buildDrawerItems(themeProvider),
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: const [
            BoxShadow(
              offset: Offset(-5, 5),
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
        ),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: buildAppBar(),
          body: buildBottomNavBar(themeProvider),
        ),
      ),
    );
  }

  Widget buildDrawerItems(ThemeProvider themeProvider) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage:
                      Image.asset('assets/images/profile-avatar.png').image,
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
              height: drawerOptions.length * 47.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView.separated(
                itemCount: drawerOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      (index == 1)
                          ? Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SvgPicture.asset(drawerOptions[index]['icon']),
                                Positioned(
                                  top: -5.h,
                                  right: -5.w,
                                  child: Container(
                                    height: 15.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                      color: lightOrangeColor,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SvgPicture.asset(drawerOptions[index]['icon']),
                      SizedBox(width: 20.w),
                      Text(
                        drawerOptions[index]['title'],
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.h);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      themeProvider.toggleTheme();
                    },
                    child: RotatedBox(
                      quarterTurns:
                          themeProvider.themeType == ThemeType.light ? 0 : 2,
                      child: SvgPicture.asset(
                        'assets/svg/drawer/theme-switch.svg',
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    '${themeProvider.themeType == ThemeType.light ? 'Light' : 'Dark'} Mode',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 7),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: cyanBackgroundColor,
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
      bottomNavBarColor: Theme.of(context).colorScheme.primary,
      bottomNavItemIconHeight: 20.h,
      bottomNavItemLabelHeight: 15.h,
      fabWidth: 50.w,
      fabIcon: Container(
        height: 50.h,
        width: 50.h,
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
          ),
          label: 'Explore',
          bottomItemSelectedColor: darkOrangeColor,
          screen: Container(
            color: Theme.of(context).colorScheme.primary,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 50.h),
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
        BottomBarItem(
          icon: SvgPicture.asset(
            'assets/svg/calendar.svg',
            color: Vx.gray400,
          ),
          label: 'Events',
          screen: Container(),
        ),
        BottomBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bookmark.svg',
            color: Vx.gray400,
          ),
          label: 'Bookmarks',
          screen: Container(),
        ),
        BottomBarItem(
          icon: SvgPicture.asset(
            'assets/svg/profile.svg',
            color: Vx.gray400,
          ),
          label: 'My Ticket',
          screen: Container(),
        ),
      ],
    );
  }

  Widget buildReferral(ThemeProvider themeProvider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Center(
        child: Card(
          color: lightBlueBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
              color: themeProvider.themeType == ThemeType.light
                  ? lightBlueBackgroundColor
                  : blueColorCategory,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -50.w,
                  bottom: -30.h,
                  child: Image.asset(
                    'assets/images/invite.png',
                    height: 160.h,
                    width: 260.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
                  child: SizedBox(
                    height: 120.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5.h),
                            Text(
                              'Invite your friends',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              'Earn 0.1 USDT for each friend \nyou refer',
                              style: TextStyle(
                                color:
                                    themeProvider.themeType == ThemeType.light
                                        ? greyTextColor
                                        : Vx.gray200,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 8.h,
                          ),
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
                          child: AirBnBText(
                            'INVITE',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10.sp),
            physics: const BouncingScrollPhysics(),
            itemCount: upcomingEvents.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  color: themeProvider.themeType == ThemeType.light
                      ? Colors.white
                      : Vx.gray600,
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
                          child: Image.asset(
                            upcomingEvents[index]['image'],
                            width: 218.w,
                            height: 131.h,
                            fit: BoxFit.cover,
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
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: upcomingEvents[index]
                                          ['date-color'],
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'JUNE',
                                    style: TextStyle(
                                      color: upcomingEvents[index]
                                          ['date-color'],
                                      fontWeight: FontWeight.bold,
                                    ),
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
                              SvgPicture.asset('assets/svg/bookmark.svg')
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
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
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://s3-alpha-sig.figma.com/img/97f5/05ab/d278e5c296cdbb95d942b33c18332f34?Expires=1704672000&Signature=Nc2wblPsEmgF4FWrzkE-MaN1-a1Ua5NNfSMsERFWUMM3sv0dCXq1HXcKk9F2rOuB3~p6nMzVJRXC3NP66Le24mwaRj9TikqAigv9D2vevt6yvLbzEZQAMMvZGXTqYg4fXpzQA8kSanEjNPklPMzgZ3GY4qX8HcNOF7bYI5~NAGbxYPgi0B1IJKVPh~sHcw8Ht69rQJfACwPDtf~TT2LCcao86VNAx5RZqr3TzcWyG8cQz-uEsP0jqvKcWFs8wUMo4lStnqFWyTgTB2ZgJ6kcL72sX2epje~RwGZaI5XGj3r1MxU8faqEz5AyYogHBZpVTBsh~N74Ee~oW5KzjEjeyw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      ],
                    ),
                    AirBnBText(
                      upcomingEvents[index]['title'],
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10.h),
                    buildGoingRow(),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/map-pin.svg'),
                        SizedBox(width: 5.w),
                        Text(
                          upcomingEvents[index]['location'],
                          style: const TextStyle(
                            color: linkTextColor,
                            fontSize: 16,
                            letterSpacing: .5,
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
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundImage: Image.asset('assets/images/dp-3.png').image,
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
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundImage: Image.asset('assets/images/dp-2.png').image,
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
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundImage: Image.asset('assets/images/dp-1.png').image,
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

  buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(200.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  lightOrangeColor,
                  darkOrangeColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 0),
              child: Column(
                children: [
                  buildTopAppBar(),
                  SizedBox(height: 10.h),
                  buildSearchBar()
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
                      SvgPicture.asset('assets/svg/calendar.svg'),
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

  Row buildSearchBar() {
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/filter-circle.svg'),
              SizedBox(width: 5.w),
              Text(
                'Filter',
                style: TextStyle(
                  color: darkOrangeColor,
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
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(5.sp),
            child: SvgPicture.asset("assets/svg/drawer.svg"),
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
