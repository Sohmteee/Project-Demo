import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/text.dart';

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
        children: [
          SizedBox(height: 30.h),
          Center(
            child: SvgPicture.asset(
              'assets/svg/drawer/profile/settings/upgrade-to-pro.svg',
              width: 343.w,
              height: 56.h,
            ),
          ),
          SizedBox(height: 40.h),
          const Divider(),
          ListTile(
            title: DMSansText(
              'Account',
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.secondary,
              size: 24.sp,
            ),
          ),
          Divider(
            color: HexColor('#D8D8D8'),
          ),
          ListTile(
            title: DMSansText(
              'Account',
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.secondary,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
