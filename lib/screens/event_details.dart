import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeerlo/colors/app_colors.dart';
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
      body: Column(
        children: [
          buildImageStack(),
          
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 6.h),
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
