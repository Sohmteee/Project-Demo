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

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        title: AirBnBText(
          'Search',
          color: HexColor('#120D26'),
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            buildSearchRow(context),
            ListView.builder(
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
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                              IconlyLight.bookmark,
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
          ],
        ),
      ),
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
            /* setState(() {
                    isOpenFilter = true; 
                  }); 
                  panelController.expand(); */
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
