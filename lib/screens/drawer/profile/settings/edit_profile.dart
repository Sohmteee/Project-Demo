import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/drawer/profile/profile.png',
              width: 96.w,
              height: 96.h,
            ),
          ],
        ),
      ),
    );
  }
}
