import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GetTicketScreen extends StatefulWidget {
  const GetTicketScreen({super.key});

  @override
  State<GetTicketScreen> createState() => _GetTicketScreenState();
}

class _GetTicketScreenState extends State<GetTicketScreen> {
  int selectedDateIndex = 2;
  final dateController = ScrollController();
  int selectedOption = 0;
  final panelController = SlidingUpPanelController();
  bool isOpenInvite = false;
  List isTicked =
      List.generate(/* friends.length */ 10, (index) => index % 2 == 0);
  List<Map<String, dynamic>> friends = [
    {
      'image': 'assets/images/view-map/friend-1.png',
      'name': 'Alex Lee',
      'followers': '2k',
    },
    {
      'image': 'assets/images/view-map/friend-2.png',
      'name': 'Micheal Ulasi',
      'followers': '56',
    },
    {
      'image': 'assets/images/view-map/friend-3.png',
      'name': 'Cristofer',
      'followers': '300',
    },
    {
      'image': 'assets/images/view-map/friend-4.png',
      'name': 'David  Silbia',
      'followers': '5k',
    },
    {
      'image': 'assets/images/view-map/friend-5.png',
      'name': 'Ashfak Sayem',
      'followers': '402',
    },
    {
      'image': 'assets/images/view-map/friend-6.png',
      'name': 'Rocks Velkeinjen',
      'followers': '893',
    },
    {
      'image': 'assets/images/view-map/friend-7.png',
      'name': 'Roman Kutepov',
      'followers': '225',
    },
    {
      'image': 'assets/images/view-map/friend-8.png',
      'name': 'Cristofer Nolan',
      'followers': '322',
    },
    {
      'image': 'assets/images/view-map/friend-9.png',
      'name': 'Jhon Wick',
      'followers': '256',
    },
    {
      'image': 'assets/images/view-map/friend-10.png',
      'name': 'Zenifero Bolex',
      'followers': '3k',
    },
  ];

  List<String> priceTitles = [
    'Premium price',
    'Regular price',
    'Free',
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    List checkoutItems = [
      {
        'title': 'Book For Yourself',
        'subtitle': 'Book a ticket just for you.',
        'icon-color': HexColor('#3D50DF'),
        'background-color': HexColor('#3D50DF').withOpacity(.11),
        'onTap': () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/checkout');
        },
      },
      {
        'title': 'Book For A Friend',
        'subtitle': 'Book a ticket for a  friend',
        'icon-color': HexColor('#F1573D'),
        'background-color': HexColor('#F1573D').withOpacity(.11),
        'onTap': () {
          Navigator.pop(context);
          panelController.expand();
        },
      },
      {
        'title': 'Book For Both',
        'subtitle': 'Book a ticket for both you and a friend',
        'icon-color': HexColor('#FFB459'),
        'background-color': HexColor('#F6EF97').withOpacity(.11),
        'onTap': () {
          Navigator.pop(context);
          panelController.expand();
        },
      },
    ];
    return PopScope(
      canPop: !isOpenInvite,
      onPopInvoked: (value) {
        if (isOpenInvite) {
          panelController.collapse();
          isOpenInvite = false;
        }
      },
      child: Scaffold(
        appBar: buildAppBar(context, themeProvider),
        backgroundColor: themeProvider.themeType == ThemeType.light
            ? lightBackgroundColor
            : darkBackgroundColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: HexColor('#D9D9D9').withOpacity(.16),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(27.r),
                ),
              ),
              child: buildTicketOptions(themeProvider),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                themeProvider.themeType == ThemeType.light
                    ? Blur(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.r),
                        ),
                        child: Container(
                          width: double.maxFinite,
                          height: 84.h,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12.r),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: double.maxFinite,
                        height: 84.h,
                        decoration: ShapeDecoration(
                          color: darkBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12.r),
                            ),
                          ),
                        ),
                      ),
                Container(
                  width: double.maxFinite,
                  height: 84.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 22.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              '\$35.00',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          DMSansText(
                            'You\'re going +1',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: HexColor('#767676').withOpacity(.76),
                          ),
                        ],
                      ),
                      ZoomTapAnimation(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                alignment: Alignment.bottomCenter,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.r),
                                  ),
                                ),
                                backgroundColor:
                                    themeProvider.themeType == ThemeType.light
                                        ? lightBackgroundColor
                                        : Colors.black,
                                insetPadding: const EdgeInsets.all(0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15.w,
                                        vertical: 10.h,
                                      ),
                                      width: double.maxFinite,
                                      child: Column(
                                        children: List.generate(
                                            checkoutItems.length, (index) {
                                          return ZoomTapAnimation(
                                            onTap: checkoutItems[index]
                                                ['onTap'],
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 13.w,
                                                vertical: 16.h,
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                vertical: 7.h,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    themeProvider.themeType ==
                                                            ThemeType.light
                                                        ? checkoutItems[index]
                                                            ['background-color']
                                                        : darkBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    index == 0
                                                        ? IconlyLight.addUser
                                                        : IconlyLight.user2,
                                                    size: 30.sp,
                                                    color: checkoutItems[index]
                                                        ['icon-color'],
                                                  ),
                                                  SizedBox(width: 18.w),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        DMSansText(
                                                          checkoutItems[index]
                                                              ['title'],
                                                          color: themeProvider
                                                                      .themeType ==
                                                                  ThemeType
                                                                      .light
                                                              ? HexColor(
                                                                  '#171766')
                                                              : Colors.white,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                        DMSansText(
                                                          checkoutItems[index]
                                                              ['subtitle'],
                                                          color: HexColor(
                                                              '#767676'),
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 13.h, horizontal: 20.w),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0, -1),
                              end: const Alignment(0, 1),
                              colors: [
                                lightOrangeColor,
                                darkOrangeColor,
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)),
                          ),
                          child: DMSansText(
                            'Checkout',
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            if (panelController.status != SlidingUpPanelStatus.collapsed)
              GestureDetector(
                onTap: () {
                  panelController.collapse();
                  setState(() {
                    isOpenInvite = false;
                  });
                },
                child: Container(
                  color: Colors.black38,
                ),
              ),
            friendsPanel(),
          ],
        ),
      ),
    );
  }

  ListView buildTicketOptions(ThemeProvider themeProvider) {
    return ListView.separated(
      itemCount: 3,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 90.h),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 215.h,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = index;
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: selectedOption == index
                        ? null
                        : themeProvider.themeType == ThemeType.light
                            ? HexColor('#D8D8D8').withOpacity(.46)
                            : HexColor('#0B0D0C'),
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
                                ? Theme.of(context).colorScheme.primary
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
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.w, 16.h, 16.w, 0.h),
                  decoration: BoxDecoration(
                    color: themeProvider.themeType == ThemeType.light
                        ? lightBackgroundColor
                        : darkBackgroundColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(19.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/get-ticket/price-pic.png',
                            width: 79.w,
                            height: 79.h,
                          ),
                          SizedBox(width: 18.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DMSansText(
                                  'International kids safe parents night out',
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(height: 8.h),
                                DMSansText(
                                  '10 spot left',
                                  color: HexColor('#747688'),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 6.w),
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) => LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                darkOrangeColor,
                                lightOrangeColor,
                              ],
                              tileMode: TileMode.mirror,
                            ).createShader(bounds),
                            child: DMSansText(
                              '\$35.00',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      DashDivider(color: HexColor('#D8D8D8')),
                      Container(
                        margin: EdgeInsets.only(top: 16.h),
                        child: Row(
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
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.chevron_right,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 12.w),
                                  DMSansText(
                                    'Show benefit',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 21.w,
                                  height: 21.h,
                                  decoration: BoxDecoration(
                                    color: HexColor('#979797').withOpacity(.12),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: HexColor('#979797'),
                                      size: 18.sp,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
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
                                          child: DMSansText(
                                            '1',
                                            textAlign: TextAlign.center,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : DMSansText(
                                          '0',
                                          textAlign: TextAlign.center,
                                          fontSize: 18.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                ),
                                Container(
                                  width: 21.w,
                                  height: 21.h,
                                  decoration: BoxDecoration(
                                    color: HexColor('#979797').withOpacity(.12),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: HexColor('#979797'),
                                      size: 18.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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

  PreferredSize buildAppBar(BuildContext context, ThemeProvider themeProvider) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 140.h),
      child: Container(
        color: themeProvider.themeType == ThemeType.light
            ? lightBackgroundColor
            : darkBackgroundColor,
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
                                    themeProvider.themeType == ThemeType.light
                                        ? lightBackgroundColor
                                        : darkBackgroundColor,
                                    themeProvider.themeType == ThemeType.light
                                        ? lightBackgroundColor
                                        : darkBackgroundColor.withOpacity(0),
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
                                    themeProvider.themeType == ThemeType.light
                                        ? lightBackgroundColor
                                        : darkBackgroundColor,
                                    themeProvider.themeType == ThemeType.light
                                        ? lightBackgroundColor
                                        : darkBackgroundColor.withOpacity(0),
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

  Widget friendsPanel() {
    final themeProvider = context.watch<ThemeProvider>();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SlidingUpPanelWidget(
          controlHeight: 0.h,
          upperBound: .85.h,
          panelController: panelController,
          enableOnTap: false,
          onStatusChanged: (status) {
            if (status == SlidingUpPanelStatus.collapsed) {
              setState(() {
                isOpenInvite = false;
              });
            } else {
              setState(() {
                isOpenInvite = true;
              });
            }
          },
          child: !isOpenInvite
              ? const SizedBox(height: 1)
              : Container(
                  padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                  ),
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 26.w,
                        height: 2.5.h,
                        margin: EdgeInsets.only(bottom: 32.h),
                        decoration: BoxDecoration(
                          color: HexColor('#B2B2B2').withOpacity(.5),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 16.h),
                        child: AirBnBText(
                          'Select Friend',
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: ShapeDecoration(
                          color: themeProvider.themeType == ThemeType.light
                              ? lightBackgroundColor
                              : darkBackgroundColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.24.sp,
                              color: HexColor('#F0F0F0'),
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 14.sp,
                                ),
                                cursorColor: lightOrangeColor,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: gray300,
                                    fontSize: 14.sp,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 14.w,
                                  ),
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/svg/search-orange.svg',
                              width: 16.w,
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Expanded(
                        // height: MediaQuery.of(context).size.height * .6,
                        child: ListView.builder(
                          itemCount: friends.length,
                          padding: EdgeInsets.only(
                            top: 16.h,
                            bottom: MediaQuery.of(context).size.width * .4,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTicked[index] = !isTicked[index];
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22.5.r,
                                      backgroundColor: Colors.white,
                                      backgroundImage: Image.asset(
                                        friends[index]['image'],
                                        height: 45.h,
                                        width: 45.w,
                                        fit: BoxFit.fitWidth,
                                      ).image,
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 3.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AirBnBText(
                                              friends[index]['name'],
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            AirBnBText(
                                              '${friends[index]['followers']} followers',
                                              textAlign: TextAlign.right,
                                              color: gray400,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/view-map/${isTicked[index] ? 'select' : 'no-select'}.svg',
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                                  ],
                                ),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 27.h),
            child: ArrowButton(
              text: 'CONTINUE',
              onPressed: () {
                panelController.collapse();
                isOpenInvite = false;
              },
            ),
          ).animate().fadeIn(duration: .5.seconds),
      ],
    );
  }
}

class DashDivider extends StatelessWidget {
  const DashDivider({super.key, this.height = 1, this.color = Colors.black});
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
