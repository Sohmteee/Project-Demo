import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
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
        return Container(
          height: 211.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F4F5588),
                blurRadius: 30,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
            border: selectedOption == index
                ? GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        lightOrangeColor,
                        darkOrangeColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    width: 1,
                  )
                : Border.all(
                    width: 0,
                    color: Colors.transparent,
                  ),
          ),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 50.h,
                decoration: BoxDecoration(
                  color: selectedOption == index
                      ? null
                      : HexColor('#D8D8D8').withOpacity(.46),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(18.r),
                  ),
                  gradient: selectedOption == index
                      ? LinearGradient(
                          colors: [
                            lightOrangeColor,
                            darkOrangeColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DMSansText(
                          priceTitles[index],
                          color: selectedOption == index
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: selectedOption == index
                              ? ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (Rect bounds) =>
                                      LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      lightOrangeColor,
                                      darkOrangeColor,
                                    ],
                                    tileMode: TileMode.mirror,
                                  ).createShader(bounds),
                                  child: Icon(
                                    Icons.check,
                                    size: 16.sp,
                                  ),
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(19.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
