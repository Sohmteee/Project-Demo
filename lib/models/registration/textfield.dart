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
    this.color,
    this.icon,
    this.trailing,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines,
  });

  /// The hint text to display in the text field.
  /// This indicates the expected input for the text field.
  final String hintText;

  /// The color of the hint text.
  final Color? color;

  /// The icon widget to display in the text field.
  Widget? icon;

  /// The trailing widget to display in the text field.
  Widget? trailing;

  /// The text editing controller for controlling the text being edited.
  /// Can be null to create a new controller internally.
  TextEditingController? controller;

  /// Indicates whether this text field should obscure input like a password field.
  final bool isPassword;

  /// The keyboard type to use for the text field.
  /// This determines what kind of input keyboard is shown to the user.
  final TextInputType keyboardType;

  /// The text input action for the text field.
  /// This determines what action to take when the input is submitted,
  /// e.g. moving focus to next field, sending the input, etc.
  final TextInputAction textInputAction;

  /// The text capitalization to use for the text field input.
  /// This determines how the text input is capitalized, e.g. none, sentences, words, etc.
  final TextCapitalization textCapitalization;

  /// The maximum number of lines to use for the text field.
  int? maxLines = 1;

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
    final themeProvider = context.watch<ThemeProvider>();

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
          if (widget.icon != null) widget.icon!,
          Expanded(
            child: TextField(
              controller: widget.controller,
              cursorColor: darkOrangeColor,
              obscureText: widget.isPassword ? !showPassword : false,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              maxLines: widget.maxLines,
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
                  color: widget.color ?? linkTextColor,
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
          if (widget.trailing != null) widget.trailing!,
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
