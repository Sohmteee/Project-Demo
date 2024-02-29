import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.secondary),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ListView(
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
                color: HexColor('#979797'),
                icon: Icon(
                  IconlyLight.profile,
                  color: HexColor('#979797'),
                ),
              ),
              SizedBox(height: 22.h),
              AppTextField(
                hintText: 'abc@gmail.com',
                color: HexColor('#979797'),
                icon: Icon(
                  IconlyLight.message,
                  color: HexColor('#979797'),
                ),
              ),
              SizedBox(height: 22.h),
              buildColoredTextField(
                context,
                themeProvider: themeProvider,
                hintText: 'Username',
              ),
              SizedBox(height: 22.h),
              AppTextField(
                hintText: 'Country',
                color: HexColor('#979797'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: HexColor('#979797'),
                ),
              ),
              SizedBox(height: 22.h),
              AppTextField(
                hintText: 'Bio',
                color: HexColor('#979797'),
                maxLines: 5,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildColoredTextField(
    BuildContext context, {
    required ThemeProvider themeProvider,
    required String hintText,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return Container(
      padding: EdgeInsets.only(right: 15.w),
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
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 20.w,
            ),
            decoration: BoxDecoration(
              color: HexColor('#E4DFDF'),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: AirBnBText(
              hintText,
              color: HexColor('#747688'),
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: darkOrangeColor,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              textCapitalization: textCapitalization,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.secondary,
              ),
              decoration: InputDecoration(
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
        ],
      ),
    );
  }
}
