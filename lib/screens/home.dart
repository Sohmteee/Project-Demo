// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:countries_flag/countries_flag.dart';
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
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: AdvancedDrawer(
        controller: drawerController,
        backdropColor: Theme.of(context).colorScheme.primary,
        drawer: buildDrawerItems(themeProvider),
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
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
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      Image.asset('assets/images/profile-avatar.png').image,
                ),
                SizedBox(height: 10),
                Text(
                  'Ashfak Sayem',
                  style: TextStyle(
                    color: themeProvider.themeType == ThemeType.light
                        ? blackTextColor
                        : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              height: drawerOptions.length * 47.0,
              padding: EdgeInsets.symmetric(horizontal: 10),
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
                                  top: -5,
                                  right: -5,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: lightOrangeColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SvgPicture.asset(drawerOptions[index]['icon']),
                      SizedBox(width: 20),
                      Text(
                        drawerOptions[index]['title'],
                        style: TextStyle(
                          color: themeProvider.themeType == ThemeType.light
                              ? blackTextColor
                              : Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
                  SizedBox(width: 15),
                  Text(
                    '${themeProvider.themeType == ThemeType.light ? 'Light' : 'Dark'} Mode',
                    style: TextStyle(
                      color: themeProvider.themeType == ThemeType.light
                          ? blackTextColor
                          : Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 7),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: cyanBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/svg/drawer/crown.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Upgrade Pro',
                    style: TextStyle(
                      color: cyanTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  BottomNavBar buildBottomNavBar(ThemeProvider themeProvider) {
    return BottomNavBar(
      bottomNavBarColor: Theme.of(context).colorScheme.primary,
      bottomNavItemIconHeight: 20,
      bottomNavItemLabelHeight: 15,
      fabWidth: 50,
      fabIcon: Container(
        height: 50,
        width: 50,
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
                const SizedBox(height: 50),
                buildUpcomingEvents(themeProvider),
                SizedBox(height: 20),
                buildReferral(themeProvider),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Near You',
                        style: TextStyle(
                          color: themeProvider.themeType == ThemeType.light
                              ? blackTextColor
                              : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Card(
          color: lightBlueBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: themeProvider.themeType == ThemeType.light
                  ? lightBlueBackgroundColor
                  : blueColorCategory,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -50,
                  bottom: -30,
                  child: Image.asset(
                    'assets/images/invite.png',
                    height: 160,
                    width: 260,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              'Invite your friends',
                              style: TextStyle(
                                color:
                                    themeProvider.themeType == ThemeType.light
                                        ? blackTextColor
                                        : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Earn 0.1 USDT for each friend \nyou refer',
                              style: TextStyle(
                                color:
                                    themeProvider.themeType == ThemeType.light
                                        ? greyTextColor
                                        : Vx.gray200,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                lightOrangeColor,
                                darkOrangeColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Text(
                            'INVITE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Events',
                style: TextStyle(
                  color: themeProvider.themeType == ThemeType.light
                      ? blackTextColor
                      : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
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
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            itemCount: upcomingEvents.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: themeProvider.themeType == ThemeType.light
                      ? Colors.white
                      : Vx.gray600,
                  borderRadius: BorderRadius.circular(20),
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
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            upcomingEvents[index]['image'],
                            width: 240,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Blur(
                                blur: 3,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(10),
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
                                      fontSize: 20,
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
                          top: 10,
                          right: 10,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Blur(
                                blur: 3,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SvgPicture.asset('assets/svg/bookmark.svg')
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      upcomingEvents[index]['title'],
                      style: TextStyle(
                        color: themeProvider.themeType == ThemeType.light
                            ? blackTextColor
                            : Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                      ),
                    ),
                    SizedBox(height: 10),
                    buildGoingRow(),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/map-pin.svg'),
                        SizedBox(width: 5),
                        Text(
                          upcomingEvents[index]['location'],
                          style: TextStyle(
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
              left: 40,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: Image.asset('assets/images/dp-3.png').image,
                ),
              ),
            ),
            Positioned(
              left: 20,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: Image.asset('assets/images/dp-2.png').image,
                ),
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: Image.asset('assets/images/dp-1.png').image,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 50),
        Text(
          '+ 20 Going',
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(200),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  lightOrangeColor,
                  darkOrangeColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Column(
                children: [
                  buildTopAppBar(),
                  const SizedBox(height: 10),
                  buildSearchBar()
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: categories[index]['color'],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/calendar.svg'),
                      const SizedBox(width: 5),
                      Text(
                        categories[index]['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
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
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Vx.gray300,
                  fontSize: 22,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        //filter button
        Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/filter-circle.svg'),
              const SizedBox(width: 5),
              Text(
                'Filter',
                style: TextStyle(
                  color: darkOrangeColor,
                  fontSize: 14,
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
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset("assets/svg/drawer.svg"),
          ),
        ),
        Column(
          children: [
            Row(
              children: const [
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                CountriesFlag(
                  getFlagPath(selectedCountry['name']),
                  width: 64.w,
                  height: 64.h,
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
