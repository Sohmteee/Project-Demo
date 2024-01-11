import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onPressed,
      child: Container(
        width: 270.w,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              lightOrangeColor,
              darkOrangeColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              blurRadius: 30.r,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: AirBnBText(
                text,
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                // letterSpacing: 1,
              ),
            ),
            Positioned(
              right: 14.w,
              child: SvgPicture.asset('assets/svg/button-arrow.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginOption extends StatelessWidget {
  /// Constructs a [LoginOption] widget.
  ///
  /// The login button with a logo, text label, and callback. Used for social
  /// login buttons.
  const LoginOption({
    super.key,
    required this.logo,
    required this.text,
    required this.onPressed,
  });

  final String logo;
  final String text;
  final Function() onPressed;

  @override

  /// Builds the login button widget.
  ///
  /// Uses [ZoomTapAnimation] for the tap animation effect. Renders the button
  /// with the provided [logo] image, [text] label, and calls [onPressed] callback
  /// on tap. Styles the button based on the current [ThemeProvider] theme.
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ZoomTapAnimation(
      onTap: onPressed,
      child: Container(
        width: 270.w,
        height: 58.h,
        decoration: BoxDecoration(
          color: themeProvider.themeType == ThemeType.light
              ? lightBackgroundColor
              : darkBackgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            if (themeProvider.themeType == ThemeType.light)
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 30.r,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 20.w),
            AirBnBText(
              text,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              // letterSpacing: 1,
            ),
          ],
        ),
      ),
    );
  }
}
