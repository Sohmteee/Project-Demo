import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
          Stack(
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
                    children: [
                      DMSansText(
                        '+20 people going',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
