import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 140.h,
        leading: BackButton(color: Theme.of(context).colorScheme.primary),
        titleSpacing: 0.w,
        backgroundColor: Colors.transparent,
        title: AirBnBText(
          'Event Details',
          color: Theme.of(context).colorScheme.primary,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
        actions: [
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
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageStack(),
            SizedBox(height: 20.h),
            DMSansText(
              'SAMUEL MEET & GREET PARTY',
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 28.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 18.h),
            buildDetailTilesColumn(context),
            SizedBox(height: 35.h),
            buildAboutEvent(context),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Row(
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
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildAboutEvent(BuildContext context) {
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
                    color: HexColor('#3C3E56'),
                    fontSize: 16.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' Read More',
                  style: TextStyle(
                    color: lightOrangeColor,
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
            trailing: Container(
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
        Positioned(
          top: 100.h,
          child: Row(
            children: [
              BackButton(color: Theme.of(context).colorScheme.primary),
              AirBnBText(
                'Event Details',
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
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
                Container(
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
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
