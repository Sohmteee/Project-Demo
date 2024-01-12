import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
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
              // padding: EdgeInsets.all(10.5.sp),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svg/bookmark.svg',
                  height: 15.h,
                  width: 15.w,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Image.asset(
            'assets/images/event/event-pic.png',
            width: double.maxFinite,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
