import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/notifications.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        titleSpacing: 0.w,
        backgroundColor: Vx.gray100,
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
      backgroundColor: Vx.gray100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: provider.notificatons.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
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
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.7),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  const Spacer(flex: 2),
                ],
              )
            : ListView.builder(
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/notification-profile.svg',
                        width: 45.w,
                        height: 45.h,
                      ),
                      SizedBox(width: 18.w),
                      Expanded(
                        child: Text.rich(
                          children: []
                        )
                      ),
                      Row(
                        children: [
                          (index == 1)
                              ? Image.asset(
                                  'assets/images/home/google-meet-icon.png',
                                  height: 16.h,
                                  width: 16.w,
                                )
                              : Image.asset(
                                  'assets/images/home/zoom-icon.png',
                                  height: 16.h,
                                  width: 16.w,
                                  fit: BoxFit.contain,
                                ),
                        ],
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
