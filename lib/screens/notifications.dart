import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        titleSpacing: 0.w,
        backgroundColor: kColo,
        title: AirBnBText(
          'Notification',
          color: HexColor('#120D26'),
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
      // backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset(
              'assets/svg/no-notification.svg',
              width: 136.w,
              height: 168.5.h,
            ),
            SizedBox(height: 40.h),
            AirBnBText(
              'No Notifications!',
              textAlign: TextAlign.center,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 7.h),
            AirBnBText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor',
              textAlign: TextAlign.center,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
