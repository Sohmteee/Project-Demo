import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final panelController = SlidingUpPanelController();
  bool isOpenInvite = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 350.h,
                elevation: 0,
                toolbarHeight: 80.h,
                leading: const BackButton(color: Colors.white),
                titleSpacing: 0.w,
                backgroundColor: darkOrangeColor,
                title: AirBnBText(
                  'Event Details',
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
                actions: [
                  ZoomTapAnimation(
                    child: IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Share.share('https://www.yeerlo.com');
                      },
                      icon: Container(
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/send.svg',
                            height: 18.h,
                            width: 18.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    child: IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {},
                      icon: Container(
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/bookmark-outline.svg',
                            height: 15.h,
                            width: 15.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: buildImageStack(),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: DMSansText(
                        'SAMUEL MEET & GREET PARTY',
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    buildDetailTilesColumn(context),
                    SizedBox(height: 35.h),
                    buildAboutEvent(context),
                    SizedBox(height: 50.h),
                    buildCommentSection(context),
                    SizedBox(height: 50.h),
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: double.maxFinite,
            height: 150.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(.1),
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary,
                ],
              ),
            ),
            child: Container(
              height: 60.h,
              margin: EdgeInsets.all(20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DMSansText(
                    'FREE - \$25',
                    textAlign: TextAlign.center,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: ArrowButton(
                      onPressed: () {},
                      text: 'GET TICKETS',
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
    );
  }

  Padding buildCommentSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                    child: AirBnBText(
                      'REVIEWS',
                      textAlign: TextAlign.center,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 3.h,
                    width: 72.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          lightOrangeColor,
                          darkOrangeColor,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ],
              ),
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
                child: Container(
                  padding: EdgeInsets.fromLTRB(5.w, 5.h, 6.w, 5.h),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.sp,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/event/message-outline.svg',
                      ),
                      SizedBox(width: 5.w),
                      DMSansText(
                        'Comment',
                        textAlign: TextAlign.center,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 24.h),
          Column(
            children: List.generate(
              6,
              (index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: buildComment(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildComment(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 17.r,
          backgroundColor: Colors.white,
          backgroundImage: Image.asset(
            'assets/images/event/comment-image.png',
            height: 34.h,
            width: 34.w,
            fit: BoxFit.fitWidth,
          ).image,
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AirBnBText(
                    'Rocks Velkeinjen',
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  AirBnBText(
                    '10 Feb',
                    textAlign: TextAlign.right,
                    color: Vx.gray400,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Row(
                children: List.generate(
                  4,
                  (index) => SvgPicture.asset('assets/svg/event/star.svg'),
                ),
              ),
              SizedBox(height: 7.h),
              DMSansText(
                'Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.',
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding buildAboutEvent(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.84,
            child: Row(
              children: [
                AirBnBText(
                  'About Event',
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'Enjoy your favorite comedy show with lovely friends and family and have a great time. ',
                  style: TextStyle(
                    color: Vx.gray400,
                    fontSize: 16.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' Read More',
                  style: TextStyle(
                    color: themeProvider.themeType == ThemeType.light
                        ? lightOrangeColor
                        : darkOrangeColor,
                    fontSize: 16.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildDetailTilesColumn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21.w, right: 18.w),
      child: Column(
        children: [
          buildDetailTile(
            context,
            leading: Container(
              width: 48.w,
              height: 48.h,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0, -1),
                  end: const Alignment(0, 1),
                  colors: [
                    lightOrangeColor.withOpacity(.1),
                    darkOrangeColor.withOpacity(.1),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    lightOrangeColor,
                    darkOrangeColor,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds),
                child: Icon(
                  IconlyBold.calendar,
                  size: 30.sp,
                ),
              ),
            ),
            title: '14 December, 2021',
            subtitle: 'Tuesday, 4:00PM - 9:00PM',
          ),
          buildDetailTile(
            context,
            leading: Container(
              width: 48.w,
              height: 48.h,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0, -1),
                  end: const Alignment(0, 1),
                  colors: [
                    lightOrangeColor.withOpacity(.1),
                    darkOrangeColor.withOpacity(.1),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    lightOrangeColor,
                    darkOrangeColor,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds),
                child: Icon(
                  IconlyBold.location,
                  size: 30.sp,
                ),
              ),
            ),
            title: 'Gala Convention Center',
            subtitle: '36 Guild Street London, UK ',
            trailing: ZoomTapAnimation(
              onTap: () {
                Navigator.pushNamed(context, '/view-map');
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 7.w,
                  vertical: 6.h,
                ),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0, -1),
                    end: const Alignment(0, 1),
                    colors: [
                      lightOrangeColor.withOpacity(.12),
                      darkOrangeColor.withOpacity(.12),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.r)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x144AD2E4),
                      blurRadius: 20,
                      offset: Offset(0, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: ShaderMask(
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
                    'View Map',
                    textAlign: TextAlign.center,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          buildDetailTile(
            context,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                'assets/images/event/organizer.png',
                width: 48.w,
                height: 48.h,
              ),
            ),
            title: 'Ashfak Sayem',
            subtitle: 'Organizer',
            trailing: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              margin: EdgeInsets.only(right: 6.w),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0, -1),
                  end: const Alignment(0, 1),
                  colors: [
                    lightOrangeColor.withOpacity(.12),
                    darkOrangeColor.withOpacity(.12),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.r)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x144AD2E4),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: ShaderMask(
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
                  'Follow',
                  textAlign: TextAlign.center,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailTile(
    BuildContext context, {
    required Widget leading,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Container(
      height: 48.h,
      margin: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          leading,
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AirBnBText(
                  title,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                AirBnBText(
                  subtitle,
                  color: Vx.gray400,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Stack buildImageStack() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          'assets/images/event/event-pic.png',
          width: double.maxFinite,
          fit: BoxFit.fitWidth,
        ),
        /* Positioned(
          top: 70.h,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                BackButton(color: Theme.of(context).colorScheme.primary),
                AirBnBText(
                  'Event Details',
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    height: 36.h,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svg/send.svg',
                        height: 18.h,
                        width: 18.w,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    height: 36.h,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svg/bookmark-outline.svg',
                        height: 15.h,
                        width: 15.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
              ],
            ),
          ),
        ), */
        Positioned(
          bottom: 18.h,
          child: Container(
            width: 290.w,
            padding: EdgeInsets.fromLTRB(18.w, 16.h, 14.w, 16.h),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x19595959),
                  blurRadius: 20,
                  offset: Offset(0, 20),
                  spreadRadius: 0,
                )
              ],
            ),
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
                  child: DMSansText(
                    '+20 people going',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    panelController.expand();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(0.00, -1.00),
                        end: const Alignment(0, 1),
                        colors: [
                          lightOrangeColor,
                          darkOrangeColor,
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x144AD2E4),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: AirBnBText(
                      'Invite',
                      textAlign: TextAlign.center,
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget friendsPanel() {
    List isTicked = List.generate(friends.length, (index) => index % 2 == 0);

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
                          'Invite Friend',
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 50.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.24.sp,
                              color: HexColor('#F0F0F0'),
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Expanded(
                        // height: MediaQuery.of(context).size.height * .6,
                        child: ListView.builder(
                          itemCount: friends.length,
                          padding: EdgeInsets.only(
                            top: 16.h,
                            bottom: MediaQuery.of(context).size.width * .25,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return StatefulBuilder(
                              builder: (context, updateState) {
                                return ZoomTapAnimation(
                                  onTap: () {
                                    updateState(() {
                                      isTicked[index] = !isTicked[index];
                                    });
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3.h),
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
                                                  color: Vx.gray400,
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 27.h),
          child: ArrowButton(
            text: 'INVITE',
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
