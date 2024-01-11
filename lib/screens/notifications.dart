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
                  DateTime time = provider.notificatons[index]['time'];
                  String timeToString = time.minute < 1 ? "Just now" : ""
                  }

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
                                text: 'commented on your post',
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
                                    '<<${provider.notificatons[index]['comment']}>>',
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
                        '${provider.notificatons[index]['time']) {}}',
                        textAlign: TextAlign.right,
                        color: HexColor('#3C3E56'),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  );
                },
              ),
      ),
    );
  }
}
