import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/notifications.dart';
import 'package:yeerlo/providers/theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final notificationProvider = context.watch<NotificationProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        titleSpacing: 0.w,
        backgroundColor: Colors.transparent,
        title: AirBnBText(
          'Notification',
          color: Theme.of(context).colorScheme.secondary,
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
      backgroundColor: gray100,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: (themeProvider.themeType == ThemeType.light) ? gray100 : null,
          image: (themeProvider.themeType == ThemeType.dark)
              ? const DecorationImage(
                  image:
                      AssetImage('assets/images/dark-gradient-background.png'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: notificationProvider.notificatons.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/no-notification.svg',
                      width: 136.w,
                      height: 168.5.h,
                    ),
                    SizedBox(height: 40.h),
                    AirBnBText(
                      'No notifications, you\'re all caught up!',
                      textAlign: TextAlign.center,
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  DateTime time =
                      notificationProvider.notificatons[index]['time'];
                  String timeToString = DateTime.now()
                              .difference(time)
                              .inMinutes <
                          1
                      ? "Just now"
                      : "${DateTime.now().difference(time).inMinutes} min ago";

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
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
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'David Silbia ',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 14.sp,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: 'commented on your post ',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 14.sp,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '<<${notificationProvider.notificatons[index]['comment']}>>',
                                  style: TextStyle(
                                    color: const Color(0xFFFFB459),
                                    fontSize: 14.sp,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DMSansText(
                          timeToString,
                          textAlign: TextAlign.right,
                          color: gray400,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
