// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/colors/hex_color.dart';
import 'package:yeerlo/providers/theme.dart';

/// AppTextField is a custom StatefulWidget that represents a text field with additional styling and functionality.
///
/// It has properties like hintText, icon, isPassword etc. to customize the text field.
/// The State class _AppTextFieldState manages internal state like showPassword.
class AppTextField extends StatefulWidget {
  AppTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
  });

  /// The hint text to display in the text field.
  /// This indicates the expected input for the text field.
  final String hintText;

  /// The icon widget to display in the text field.
  final Widget icon;

  /// The text editing controller for controlling the text being edited.
  /// Can be null to create a new controller internally.
  TextEditingController? controller;

  /// Indicates whether this text field should obscure input like a password field.
  final bool isPassword;

  /// The keyboard type to use for the text field.
  /// This determines what kind of input keyboard is shown to the user.
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    widget.controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
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
          widget.icon,
          Expanded(
            child: TextField(
              controller: widget.controller,
              cursorColor: darkOrangeColor,
              obscureText: widget.isPassword ? !showPassword : false,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.secondary,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
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
          if (widget.isPassword)
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
