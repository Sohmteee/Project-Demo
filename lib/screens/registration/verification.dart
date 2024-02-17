import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:your_app_name/utils/hex_color.dart';
import 'package:your_app_name/utils/iconly_light.dart';
import 'package:your_app_name/utils/theme_provider.dart';
import 'package:your_app_name/utils/theme_type.dart';
import 'package:your_app_name/widgets/airbnb_text.dart';
import 'package:your_app_name/widgets/arrow_button.dart';
import 'package:your_app_name/widgets/dmsans_text.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool rememberMe = true;
  late Timer timer;
  int time = 59;
  final String email = 'ikay@gmail.com';
  String correctOTP = '4444';

  void restartTimer() {
    setState(() {
      time = 59;
      timer = Timer.periodic(1.seconds, (timer) {
        if (mounted) {
          if (time > 0) {
            setState(() {
              time--;
            });
          } else {
            timer.cancel();
          }
        }
      });
    });
  }

  @override
  void initState() {
    timer = Timer.periodic(1.seconds, (timer) {
      if (mounted) {
        if (time > 0) {
          setState(() {
            time--;
          });
        } else {
          timer.cancel();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AirBnBText(
                  'Verification',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: 21.h),
              Align(
                alignment: Alignment.centerLeft,
                child: DMSansText(
                  'We’ve sent  a verification code to \n$email',
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.8,
                ),
              ),
              SizedBox(height: 27.h),
              buildOTPField(),
              SizedBox(height: 40.h),
              ArrowButton(
                text: 'CONTINUE',
                onPressed: () {
                  timer.cancel();
                  setState(() {
                    time = 0;
                  });
                  Navigator.pushNamed(context, '/location');
                },
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {
                  if (time == 0) {
                    restartTimer();
                  }
                },
                child: time == 0
                    ? ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) => LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            lightOrangeColor,
                            darkOrangeColor,
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds),
                        child: AirBnBText(
                          'Re-send code',
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AirBnBText(
                            'Re-send code in  ',
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) => LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                lightOrangeColor,
                                darkOrangeColor,
                              ],
                              tileMode: TileMode.mirror,
                            ).createShader(bounds),
                            child: AirBnBText(
                              '0:${time.toString().length < 2 ? '0' : ''}$time',
                              color: themeProvider.themeType == ThemeType.light
                                  ? lightOrangeColor
                                  : darkOrangeColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Pinput buildOTPField() {
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: TextStyle(
        fontSize: 24.sp,
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: HexColor('#DADADA')),
        borderRadius: BorderRadius.circular(15.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: lightOrangeColor),
      /* gradient: LinearGradient(
        colors: [
          lightOrangeColor,
          darkOrangeColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ), */
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      validator: (s) {
        return s == correctOTP
            ? null
            : 'OTP is incorrect (Correct OTP is $correctOTP)';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: false,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      preFilledWidget: DMSansText(
        '-',
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: HexColor('#DADADA'),
      ),
      separatorBuilder: (index) => SizedBox(width: 30.w),
    );
  }
}
