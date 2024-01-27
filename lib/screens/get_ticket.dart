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
  final dateController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: HexColor('#D9D9D9').withOpacity(.16),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(27.r),
          ),
        ),
        child: buildTicketOptions(),
      ),
    );
  }

  ListView buildTicketOptions() {
    int selectedOption = 0;
    List<String> priceTitles = [
      'Premium price',
      'Regular price',
      'Free',
    ];

    return ListView.separated(
      itemCount: 3,
      padding: EdgeInsets.symmetric(
        vertical: 22.sp,
        horizontal: 16.w,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(18.r),
                ),
                gradient: LinearGradient(
                  colors: [
                    lightOrangeColor,
                    darkOrangeColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 22.h,
        );
      },
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 140.h),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                top: 30.h,
                bottom: 20.h,
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
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Stack(
                        children: [
                          ListView.separated(
                            itemCount: 30,
                            controller: dateController,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            itemBuilder: (BuildContext context, int index) {
                              return ZoomTapAnimation(
                                onTap: () {
                                  setState(() {
                                    selectedDateIndex = index;
                                  });
                                },
                                child: Container(
                                  width: 48.w,
                                  height: 48.h,
                                  // padding: EdgeInsets.all(8.sp),
                                  decoration: ShapeDecoration(
                                      color: selectedDateIndex == index
                                          ? null
                                          : HexColor('#979797')
                                              .withOpacity(.09),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
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
                                  child: Center(
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
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 9.w),
                          ),
                          Positioned(
                            left: -1,
                            child: Container(
                              height: 48.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(0),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: -1,
                            child: Container(
                              height: 48.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(0),
                                  ],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                              ),
                            ),
                          ),
                        ],
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
    );
  }
}
