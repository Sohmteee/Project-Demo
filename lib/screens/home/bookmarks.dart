// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: AirBnBText(
          'Bookmarks',
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/search.svg',
              color: Theme.of(context).colorScheme.secondary,
              height: 24.sp,
            ),
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
      body: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemBuilder: (context, index) {
          return Container(
            height: 112.h,
            padding: EdgeInsets.all(10.sp),
            margin: EdgeInsets.symmetric(vertical: 8.h),
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
                      AirBnBText(
                        '1ST MAY- SAT -2:00 PM',
                        color: const Color(0xFFFFB459),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      AirBnBText(
                        'International kids safe parents night out',
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
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
                  child: SvgPicture.asset(
                    'assets/svg/bookmarks/bookmarks.svg',
                    height: 16.h,
                    width: 16.w,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
