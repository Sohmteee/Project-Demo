import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class ViewMapScreen extends StatefulWidget {
  const ViewMapScreen({super.key});

  @override
  State<ViewMapScreen> createState() => _ViewMapScreenState();
}

class _ViewMapScreenState extends State<ViewMapScreen> {
  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    ); */
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70.h,
        title: Container(
          width: 262.w,
          height: 50.h,
          margin: EdgeInsets.only(top: 15.h, bottom: 10.h, left: 20.sp),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFFEEEEEE),
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            shadows: [
              BoxShadow(
                color: const Color(0x7FD3D1D8),
                blurRadius: 60.r,
                offset: const Offset(0, 40),
                spreadRadius: 0,
              )
            ],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 15.h, bottom: 10.h, right: 25.sp),
            padding: EdgeInsets.all(12.sp),
            width: 50.w,
            height: 50.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFEEEEEE),
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              shadows: [
                BoxShadow(
                  color: const Color(0x7FD3D1D8),
                  blurRadius: 60.r,
                  offset: const Offset(0, 40),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Image.asset(
              'assets/images/view-map/locate.png',
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/view-map/map.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Expanded(
              child: Container(),
            ),
            Positioned(
              bottom: 180.h,
              right: 32.w,
              child: SvgPicture.asset(
                'assets/svg/filter-circle.svg',
                height: 35.h,
                width: 35.w,
              ),
            ),
            Container(
              height: 106.h,
              padding: EdgeInsets.fromLTRB(10.w, 14.h, 14.w, 14.h),
              margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
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
                      'assets/images/view-map/map-pic-cover.png',
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
                          'Wed, Apr 28 • 5:30 PM',
                          color: const Color(0xFFFFB459),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        AirBnBText(
                          'Jo Malone London’s Mother’s Day Presents',
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
                    child: Icon(
                      IconlyBold.bookmark,
                      size: 16.sp,
                      color: redColorCategory,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
