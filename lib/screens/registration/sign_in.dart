import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/button.dart';
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
                'Sign in',
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
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
