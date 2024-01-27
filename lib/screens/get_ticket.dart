import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GetTicketScreen extends StatefulWidget {
  const GetTicketScreen({super.key});

  @override
  State<GetTicketScreen> createState() => _GetTicketScreenState();
}

class _GetTicketScreenState extends State<GetTicketScreen> {
  int selectedDateIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 200.h),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  top: 30.h,
                  bottom: 26.h,
                ),
                child: Row(
                  children: [
                    BackButton(color: Theme.of(context).colorScheme.secondary),
                    DMSansText(
                      'Get a Ticket',
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/get-ticket/button-outline.svg',
                          width: 34.w,
                          height: 34.h,
                        ),
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              darkOrangeColor,
                              lightOrangeColor,
                            ],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds),
                          child: Icon(
                            Icons.chevron_left,
                            size: 20.sp,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: 48.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: ListView.separated(
                          itemCount: 30,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          itemBuilder: (BuildContext context, int index) {
                            return ZoomTapAnimation(
                              onTap: () {
                                
                              },
                              child: Container(
                                width: 48.w,
                                height: 48.h,
                                padding: EdgeInsets.all(8.sp),
                                decoration: ShapeDecoration(
                                    color: selectedDateIndex == index
                                        ? null
                                        : HexColor('#979797').withOpacity(.09),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    gradient: selectedDateIndex == index
                                        ? LinearGradient(
                                            colors: [
                                              lightOrangeColor,
                                              darkOrangeColor,
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          )
                                        : null),
                                child: DMSansText(
                                  '${index + 1 < 10 ? '0${index + 1}' : '${index + 1}'}\nDec',
                                  textAlign: TextAlign.center,
                                  color: selectedDateIndex == index
                                      ? Colors.white
                                      : HexColor('#979797'),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 9.w),
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/get-ticket/button-outline.svg',
                          width: 34.w,
                          height: 34.h,
                        ),
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              darkOrangeColor,
                              lightOrangeColor,
                            ],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds),
                          child: Icon(
                            Icons.chevron_right,
                            size: 20.sp,
                          ),
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
      body: Column(),
    );
  }
}
