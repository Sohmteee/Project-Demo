import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/models/registration/textfield.dart';
import 'package:yeerlo/models/text.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Image.asset(
                'assets/images/drawer/profile/profile.png',
                width: 96.w,
                height: 96.h,
              ),
              SizedBox(height: 22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      // Navigator.pushNamed(context, '/wallet');
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.w, vertical: 6.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        gradient: LinearGradient(
                          colors: [
                            lightOrangeColor,
                            darkOrangeColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: DMSansText(
                        'Upload New Image',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 18.sp),
                  ZoomTapAnimation(
                    onTap: () {
                      // Navigator.pushNamed(context, '/settings');
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.w, vertical: 6.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                            colors: [
                              lightOrangeColor,
                              darkOrangeColor,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      child: ShaderMask(
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
                        child: DMSansText(
                          'Select From Gallery',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              AppTextField(
                hintText: 'Full name',
                icon: const Icon(IconlyLight.profile),
              ),
              SizedBox(height: 22.h),
              AppTextField(
                hintText: 'abc@gmail.com',
                icon: const Icon(IconlyLight.message),
              ),
              SizedBox(height: 22.h),
            ],
          ),
        ),
      ),
    );
  }

  buildColoredTextField(BuildContext context,
      {required ThemeProvider themeProvider,
      required String hintText,
      IconData? icon}) {
    Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: themeProvider.themeType == ThemeType.light
              ? HexColor('#E4DFDF')
              : const Color(0x21E4DEDE),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          if (icon != null) icon!,
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: darkOrangeColor,
              obscureText: isPassword ? !showPassword : false,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              textCapitalization: textCapitalization,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.secondary,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: linkTextColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 20.h,
                ),
              ),
            ),
          ),
          if (trailing != null) trailing!,
          if (isPassword)
            GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: Icon(
                showPassword ? IconlyLight.show : IconlyLight.hide,
                size: 22.sp,
                color: registrationIconColor,
              ),
            ),
        ],
      ),
    );
  }
}
