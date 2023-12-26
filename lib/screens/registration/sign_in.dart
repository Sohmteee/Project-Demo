import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/switch.dart';
import 'package:yeerlo/models/registration/textfield.dart';
import 'package:yeerlo/models/text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/logos/light-logo.png',
              width: 174.w,
              height: 84.h,
            ),
            SizedBox(height: 44.h),
            Align(
              alignment: Alignment.centerLeft,
              child: AirBnBText(
                'Sign In',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: themedTextColor,
              ),
            ),
            SizedBox(height: 21.h),
            const AppTextField(
              hintText: 'abc@email.com',
              icon: IconlyLight.message,
            ),
            SizedBox(height: 19.h),
            const AppTextField(
              isPassword: true,
              hintText: 'Your Password',
              icon: IconlyLight.lock,
            ),
            SizedBox(height: 19.h),
            Row(
              children: [
                AppSwitch(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                ),
                SizedBox(width: 4,)
                AirBnBText(
                  'Remember Me',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
