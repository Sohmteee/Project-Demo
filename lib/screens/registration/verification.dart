import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/registration/textfield.dart';
import 'package:yeerlo/models/text.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AirBnBText(
                  'Sign up',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: themedTextColor,
                ),
              ),
              SizedBox(height: 21.h),
              AppTextField(
                hintText: 'Full name',
                icon: Icon(
                  IconlyLight.profile,
                  size: 22.sp,
                  color: registrationIconColor,
                ),
              ),
              SizedBox(height: 19.h),
              AppTextField(
                hintText: 'abc@email.com',
                icon: Icon(
                  IconlyLight.message,
                  size: 22.sp,
                  color: registrationIconColor,
                ),
              ),
              SizedBox(height: 19.h),
              AppTextField(
                isPassword: true,
                hintText: 'Your Password',
                icon: Icon(
                  IconlyLight.lock,
                  size: 22.sp,
                  color: registrationIconColor,
                ),
              ),
              SizedBox(height: 19.h),
              AppTextField(
                isPassword: true,
                hintText: 'Confirm Password',
                icon: Icon(
                  IconlyLight.lock,
                  size: 22.sp,
                  color: registrationIconColor,
                ),
              ),
              SizedBox(height: 19.h),
              AppTextField(
                hintText: 'Referral',
                icon: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(width: 20.w),
                    Positioned(
                      left: -7.w,
                      child: Icon(
                        IconlyLight.profile,
                        size: 22.sp,
                        color: registrationIconColor,
                      ),
                    ),
                    Positioned(
                      right: -7.w,
                      child: Icon(
                        IconlyLight.profile,
                        size: 22.sp,
                        color: registrationIconColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              ArrowButton(
                text: 'SIGN UP',
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, '/home');
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
                          color: lightOrangeColor,
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
    );
  }
}
