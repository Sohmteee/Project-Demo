import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/data.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final panelController = SlidingUpPanelController();
  int selectedFilterCategoryIndex = 0;
  int selectedTimeCategoryIndex = 1;
  bool isOpenFilter = false;

  @override
  void initState() {
    super.initState();

    panelController.collapse();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isOpenFilter = false;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: BackButton(color: Theme.of(context).colorScheme.secondary),
            title: AirBnBText(
              'Search',
              color: HexColor('#120D26'),
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                buildSearchRow(context),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 112.h,
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
                                'assets/images/home/near-you-2.png',
                                width: 79.w,
                                height: 92.h,
                              ),
                            ),
                            SizedBox(width: 18.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
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
                    color: (themeProvider.themeType == ThemeType.dark)
                        ? darkBackgroundColor
                        : lightBackgroundColor,
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
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: AirBnBText(
                                'Filter',
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          buildFilterCategories(context),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AirBnBText(
                                    'Time & Date',
                                    color: HexColor('#120D26'),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          buildTimeCategories(context),
                          SizedBox(height: 14.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                buildChooseCalendar(),
                                SizedBox(height: 16.h),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AirBnBText(
                                    'Location',
                                    color: HexColor('#120D26'),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                buildChooseLocation(),
                                SizedBox(height: 24.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AirBnBText(
                                      'Select Price Range',
                                      color: HexColor('#120D26'),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    AirBnBText(
                                      '\$20-\$120',
                                      color: HexColor('#3F38DD'),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
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
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 58.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: HexColor('#E5E5E5'),
                              ),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Center(
                              child: AirBnBText(
                                'RESET',
                                textAlign: TextAlign.center,
                                color: Theme.of(context).colorScheme.secondary,
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
                      Spacer(flex: 2),
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  SizedBox buildFilterCategories(BuildContext context) {
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
                    : const Color(0xFFE7E7E7),
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
                        ? Colors.white
                        : HexColor('#979797'),
                  ),
                  SizedBox(width: 5.w),
                  DMSansText(
                    categories[index]['title'],
                    color: index == selectedFilterCategoryIndex
                        ? Colors.white
                        : HexColor('#979797'),
                    fontSize: 20.sp,
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

  SizedBox buildTimeCategories(BuildContext context) {
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
              border: index != selectedTimeCategoryIndex
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
            ),
            child: Center(
              child: DMSansText(
                times[index],
                color: index == selectedTimeCategoryIndex
                    ? Colors.white
                    : HexColor('#979797'),
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildChooseCalendar() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFFE6E6E6),
        ),
        borderRadius: BorderRadius.circular(10),
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
              color: HexColor('#807A7A'),
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

  Container buildChooseLocation() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFFE6E6E6),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          children: [
            Image.asset('assets/images/home/filter-location.png'),
            const Spacer(),
            DMSansText(
              'New York, USA',
              color: const Color(0xFF141736),
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

  Row buildSearchRow(BuildContext context) {
    return Row(
      children: [
        //search button
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
          child: SvgPicture.asset(
            'assets/svg/search-orange.svg',
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
              borderRadius: BorderRadius.circular(30.r),
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
                SvgPicture.asset('assets/svg/filter-circle-1.svg'),
                SizedBox(width: 5.w),
                Text(
                  'Filter',
                  style: TextStyle(
                    color: Colors.white,
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
}
