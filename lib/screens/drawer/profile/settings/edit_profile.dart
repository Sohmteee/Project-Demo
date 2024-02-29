import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/models/registration/textfield.dart';
import 'package:yeerlo/models/text.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
