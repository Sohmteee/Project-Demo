import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/registration/textfield.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft,
            color: Theme.of(context).colorScheme.secondary,
            size: 24.sp,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80.h),
        decoration: (themeProvider.themeType == ThemeType.dark)
            ? const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/dark-gradient-background.png'),
                  fit: BoxFit.cover,
                ),
              )
            : null,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AirBnBText(
                    'Reset Password',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(height: 21.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DMSansText(
                    'Please enter your email address to request a password reset code',
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.8,
                  ),
                ),
                SizedBox(height: 26.h),
                AppTextField(
                  isPassword: true,
                  hintText: 'Confirm Password',
                  icon: Icon(
                    IconlyLight.lock,
                    size: 22.sp,
                    color: registrationIconColor,
                  ),
                ),
                SizedBox(height: 26.h),
                ArrowButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    Navigator.pushNamed(context, '/verification');
                  },
                ),
                SizedBox(height: 24.h),
                AirBnBText(
                  'OR',
                  color: const Color(0xFF9D9898),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 5.h),
                LoginOption(
                  logo: 'assets/images/logos/google-logo.png',
                  text: 'Login with Google',
                  onPressed: () {},
                ),
                Opacity(
                  opacity: /* Platform.isIOS ? 1 : 0 */ 1,
                  child: Column(
                    children: [
                      SizedBox(height: 18.h),
                      LoginOption(
                        logo: 'assets/images/logos/apple-logo.png',
                        text: 'Login with Apple ID',
                        onPressed: () {
                          if (Platform.isIOS) {}
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account?  ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16.sp,
                            fontFamily: 'AirBnB',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: themeProvider.themeType == ThemeType.light
                                ? lightOrangeColor
                                : darkOrangeColor,
                            fontSize: 16.sp,
                            fontFamily: 'AirBnB',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
