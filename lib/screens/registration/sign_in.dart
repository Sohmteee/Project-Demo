import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/registration/switch.dart';
import 'package:yeerlo/models/registration/textfield.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

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
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
        return Container(
          decoration: (themeProvider.themeType == ThemeType.dark)
              ? const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/dark-gradient-background.png'),
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    SizedBox(height: 45.h),
                    Image.asset(
                      'assets/images/logos/light-logo.png',
                      width: 174.w,
                      height: 84.h,
                    ).animate(onPlay: (controller) {
                      controller.repeat();
                    }).shimmer(
                      delay: 2.seconds,
                      color: lightOrangeColor,
                      duration: 2.seconds,
                    ),
                    SizedBox(height: 44.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AirBnBText(
                        'Sign in',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    SizedBox(height: 21.h),
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
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgot-password');
                          },
                          child: AirBnBText(
                            'Forgot Password?',
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 36.h),
                    ArrowButton(
                      text: 'SIGN IN',
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
                        Navigator.pushNamed(context, '/sign-up');
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account?  ',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16.sp,
                                fontFamily: 'AirBnB',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(
                                color:
                                    themeProvider.themeType == ThemeType.light
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
      }),
    );
  }
}
