import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/registration/switch.dart';
import 'package:yeerlo/models/registration/textfield.dart';
import 'package:yeerlo/models/text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      },
                      child: Row(
                        children: [
                          AppSwitch(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                          ),
                          SizedBox(width: 6.w),
                          AirBnBText(
                            'Remember Me',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    AirBnBText(
                      'Forgot Password?',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: 36.h),
                ArrowButton(
                  text: 'SIGN IN',
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
      ),
    );
  }
}
