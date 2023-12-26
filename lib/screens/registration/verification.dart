import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/button.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool rememberMe = true;

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.only(top: 80.h),
          decoration: (themeProvider.themeType == ThemeType.dark)
              ? const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/dark-gradient-background.png'),
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
                    'We’ve sent  a verification code to \nikay@gmail.com',
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 27.h),
                buildOTPField(),
                SizedBox(height: 40.h),
                ArrowButton(
                  text: 'CONTINUE',
                  onPressed: () {
                    // Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                SizedBox(height: 24.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Resend code in  ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16.sp,
                            fontFamily: 'AirBnB',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '0:20',
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
                Expanded(child: Container()),
              ],
            ),
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
    );

    /* final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    ); */
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      // submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s == '4444' ? null : 'OTP is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
      preFilledWidget: DMSansText(
        '-',
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: HexColor('#DADADA'),
      ),
    );
  }
}
