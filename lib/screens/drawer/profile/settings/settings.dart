import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/screens/drawer/upgrade.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
        title: Text(
          'Settings',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 30.h),
          Center(
            child: ZoomTapAnimation(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                    child: const UpgradeScreen(),
                    type: PageTransitionType.bottomToTop),
              ),
              child: SvgPicture.asset(
                'assets/svg/drawer/profile/settings/upgrade-to-pro.svg',
                width: 343.w,
                height: 56.h,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Divider(
            color: HexColor('#D8D8D8'),
          ),
          settingsListTile(
            context,
            title: 'Edit Profile',
            onTap: () => Navigator.pushNamed(context, '/edit-profile'),
          ),
          Divider(
            color: HexColor('#D8D8D8'),
          ),
          settingsListTile(
            context,
            title: 'Change Password',
            onTap: () => Navigator.pushNamed(context, '/change-password'),
          ),
          Divider(
            color: HexColor('#D8D8D8'),
          ),
          settingsListTile(
            context,
            title: 'Withdrawal Info',
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          Divider(
            color: HexColor('#D8D8D8'),
          ),
          settingsListTile(
            context,
            title: 'Notification',
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          Divider(
            color: HexColor('#D8D8D8'),
          ),
          settingsListTile(
            context,
            title: 'Terms & Conditions',
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          Divider(
            color: HexColor('#D8D8D8'),
          ),
          settingsListTile(
            context,
            title: 'Privacy & Security',
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          Divider(
            color: HexColor('#D8D8D8'),
          ),
          settingsListTile(
            context,
            title: 'Help',
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          Divider(
            color: HexColor('#D8D8D8'),
          ),
        ],
      ),
    );
  }

  ListTile settingsListTile(BuildContext context,
      {required String title, void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      title: DMSansText(
        title,
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).colorScheme.secondary,
        size: 24.sp,
      ),
    );
  }
}
